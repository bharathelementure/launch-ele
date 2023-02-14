import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/signin_screen.dart';

class RecoverCredentials extends StatefulWidget {
  const RecoverCredentials({super.key});

  @override
  State<RecoverCredentials> createState() => _RecoverCredentialsState();
}

class _RecoverCredentialsState extends State<RecoverCredentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Image.asset('assets/images/11111-hdpi.png'),
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
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 0,
                    child: SizedBox(
                      width: 200,
                      height: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.task_alt_outlined,size: 40,),
                          const SizedBox(height: 30),
                          Text(
                            'Please check your inbox,we\'ve sent the password link for the registered email',
                            style: GoogleFonts.barlow(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
            TextButton(
                onPressed: () {
                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SignInScreen()));
                  // Navigator.pushNamed(context, '/SignInScreen');
                },
                child: Text(
                  'SIGN IN',
                  style: GoogleFonts.barlow(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline)),
                ))]))
          ],
        ),
      )),
    );
  }
}
