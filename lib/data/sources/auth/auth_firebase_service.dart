import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest createUserRequest);

  Future<void> signin();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );

      return const Right("User created successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return const Left("Email already in use");
      } else if (e.code == "weak-password") {
        return const Left("Password is too weak");
      }

      return const Left("Failed to create user");
    }
  }

  @override
  Future<void> signin() async {
    // Implementation
  }
}
