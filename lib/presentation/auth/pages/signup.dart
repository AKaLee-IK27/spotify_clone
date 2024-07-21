import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RegisterText(),
            SizedBox(height: 50),
            FullNameField(),
            SizedBox(height: 20),
            EmailField(),
            SizedBox(height: 20),
            PasswordField(),
          ],
        ),
      ),
    );
  }
}

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Register',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}

class FullNameField extends StatelessWidget {
  const FullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Full Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
