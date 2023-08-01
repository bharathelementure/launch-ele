import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:launch_ele/src/screens/dashBoard/dash_board.dart';
import 'package:launch_ele/src/screens/signIn_forgotpassword/signin_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const DashBoard();
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
