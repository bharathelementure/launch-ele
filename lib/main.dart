import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:launch_ele/dash_board.dart';
import 'package:launch_ele/signin_screen.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> backgroundHandler(RemoteMessage message) async {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        // initialRoute: '/SignInScreen',
        debugShowCheckedModeBanner: false,
        home: const AuthPage(),
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}
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
