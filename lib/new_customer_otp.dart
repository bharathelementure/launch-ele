import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/otp_valid.dart';
import 'package:pinput/pinput.dart';

class NewCustomerOTP extends StatefulWidget {
  const NewCustomerOTP({super.key});

  @override
  State<NewCustomerOTP> createState() => _NewCustomerOTPState();
}

class _NewCustomerOTPState extends State<NewCustomerOTP> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";
    return Scaffold(
      appBar: AppBar(centerTitle: false, actions: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset('assets/images/11111-hdpi.png',scale: 2),
          /*Text('Launch.',
              style: GoogleFonts.caveat(
                textStyle:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 25,
              ),
              Text(
                'by Elementure',
                style: GoogleFonts.barlow(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const Text(
                '.',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),*/
        ]),
      ]),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'OTP For Installation',
                  style: GoogleFonts.barlow(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 58, right: 58),
                    child: SizedBox(
                      width: 180,
                      height: 100,
                      child: Text(
                        'Enter the OTP Received for Customer Registered Mobile No.',
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
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 30,
                  ),
                  Pinput(
                    length: 6,
                    // defaultPinTheme: defaultPinTheme,
                    // focusedPinTheme: focusedPinTheme,
                    // submittedPinTheme: submittedPinTheme,
                    showCursor: true,
                    onChanged: (value) {
                      code = value;
                    },
                    onCompleted: (pin) => print(pin),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend OTP',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),
                      )),
                  SizedBox(
                      height: 50,
                      width: 290,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      backgroundColor: Colors.grey.shade200,
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      icon: const Icon(
                                        Icons.close_outlined,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Kindly Check OTP Entered',
                                        style: GoogleFonts.barlow(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: const Text(
                                          'You can get a new OTP by clicking Resend Button after 30 Seconds'),
                                    ));
                                     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const OTPValid()));
                            // Navigator.pushNamed(context, '/OTPValid');
                          },
                          child: Text(
                            'SUBMIT',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          )))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
