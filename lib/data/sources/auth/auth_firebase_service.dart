import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return const Right("User created successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return const Left("Email already in use");
      } else if (e.code == "weak-password") {
        return const Left("Password is too weak");
      } else if (e.code == "invalid-email") {
        return const Left("Invalid email");
      }

      return const Left("Failed to create user");
    }
  }

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right("User signed in successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return const Left("User not found");
      } else if (e.code == "wrong-password") {
        return const Left("Wrong password");
      } else if (e.code == "invalid-email") {
        return const Left("Invalid email");
      } else if (e.code == "invalid-credential") {
        return const Left("Wrong password for that user");
      }

      return const Left("Failed to sign in");
    }
  }
}
