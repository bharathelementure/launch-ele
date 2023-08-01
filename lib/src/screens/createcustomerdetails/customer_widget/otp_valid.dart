// Verified customer with otp

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/src/screens/adddevice_info_nodes/adding_nodes.dart';
// import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
// import 'package:launch_ele/src/screens/appbar.dart/drawer.dart';

class OTPValid extends StatefulWidget {
  const OTPValid({super.key});

  @override
  State<OTPValid> createState() => _OTPValidState();
}

class _OTPValidState extends State<OTPValid> {
  get result => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.check_circle,
              size: 50,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Customer Successfully Created',
              style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
                width: 180,
                height: 80,
                child: Text(
                  'You can add Devices and Nodes to this Customer.',
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
          Center(
            child: SizedBox(
                height: 50,
                width: 290,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AddingNodes(
                                    scanedDevice: result.toString(),
                                  )));
                    },
                    child: Text(
                      'ADD DEVICE',
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                    ))),
          )
        ],
      )),
    );
  }
}
