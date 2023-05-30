import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/adding_nodes.dart';
import 'package:launch_ele/drawer.dart';

class OTPValid extends StatefulWidget {
  const OTPValid({super.key});

  @override
  State<OTPValid> createState() => _OTPValidState();
}

class _OTPValidState extends State<OTPValid> {
  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 110),
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
                                      builder: (BuildContext context) =>
                                          const AddingNodes()));
                          // Navigator.pushNamed(context, '/AddingNodes');
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
