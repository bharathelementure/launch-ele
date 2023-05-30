import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:launch_ele/forgot_password.dart';
import 'package:launch_ele/main.dart';
import 'package:overlay_support/overlay_support.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool _hasInternet = false;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/11111-hdpi.png',
              ),
              /*Text('Launch.',
                  style: GoogleFonts.caveat(
                    textStyle: const TextStyle(
                        fontSize: 41, fontWeight: FontWeight.bold),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 45,
                  ),
                  Text(
                    'by Elementure',
                    style: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const Text(
                    '.',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),*/
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: SizedBox(
                    height: 130,
                    width: 290,
                    child: Icon(
                      Icons.rocket_launch_outlined,
                      size: 100,
                      color: Color(0xFF7E6E4D),
                    )),
              ),
              const SizedBox(height: 30),
              TextField(
                textInputAction: TextInputAction.next,
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text(
                      'Email',
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(fontSize: 16)),
                    )),
              ),
              const SizedBox(height: 15),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                controller: _passwordcontroller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text(
                      'Password',
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(fontSize: 16)),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ForgotPassword()));
                        // Navigator.pushNamed(context, '/ForgotPassword');
                      },
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      )),
                ],
              ),
              Center(
                child: SizedBox(
                    height: 50,
                    width: 290,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        onPressed: () async {
                          /*showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    icon: const Icon(
                                      Icons.info,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Please check your Credentials!',
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: const Text(
                                        'If you don\'t have access, kindly connect to vendor for the Acccess.'),
                                  ));*/
                          signIn();
                          _hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          final color =
                              _hasInternet ? Colors.green : Colors.red;
                          final text =
                              _hasInternet ? 'Internet' : 'No Internet';

                          showSimpleNotification(
                              Text(text,
                                  style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                              background: color);
                          /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DashBoard()));*/
                          // Navigator.pushNamed(context, '/DashBoard');
                        },
                        child: Text(
                          'SIGN IN',
                          style: GoogleFonts.notoSans(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.white)),
                        ))),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text, password: _passwordcontroller.text);
    } on FirebaseAuthException {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                icon: const Icon(
                  Icons.info,
                  size: 50,
                  color: Colors.black,
                ),
                title: Text(
                  'Please check your Credentials!',
                  style: GoogleFonts.notoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                content: const Text(
                    'If you don\'t have access, kindly connect to vendor for the Acccess.'),
              ));
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
