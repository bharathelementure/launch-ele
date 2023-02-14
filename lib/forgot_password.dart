import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/recover_credentials.dart';
import 'package:launch_ele/signin_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset('assets/images/11111-hdpi.png'),
            const SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(30)),
                      Text(
                        '!',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black)),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'FORGOT PASSWORD',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 58, right: 58),
                    child: SizedBox(
                      width: 180,
                      height: 100,
                      child: Text(
                        'No worries, We get you back. Please enter your registered email',
                        style: GoogleFonts.barlow(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: Text(
                    'Email',
                    style: GoogleFonts.barlow(
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
                      onPressed: () {showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(15)),
                                    icon: const Icon(
                                      Icons.cancel,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'User Doesn\'t Exists',
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: const Text(
                                        'If you don\'t have access, kindly connect to vendor for the Access.'),
                                    /*actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'))
                                      ]*/
                                  ));
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const RecoverCredentials()));
                        // Navigator.pushNamed(context, '/RecoverCredentials');
                      },
                      child: Text(
                        'FORGOT PASSWORD',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                      ))),
            )
          ]),
        ),
      ),
    ));
  }
}
