// verified for the replacement of the device to replacement and addDevice

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/src/screens/adddevice_info_nodes/add_device.dart';
import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
import 'package:launch_ele/src/screens/appbar.dart/drawer.dart';
import 'package:launch_ele/src/screens/replace_approval_device/replace_device.dart';
import 'package:launch_ele/src/screens/replace_approval_device/replacement_device.dart';
import 'package:launch_ele/src/screens/Scan_device/scan_device_node.dart';

import '../createcustomerdetails/customer_widget/customer_details.dart';

class ReplacementApproved extends StatefulWidget {
  const ReplacementApproved({super.key});

  @override
  State<ReplacementApproved> createState() => _ReplacementApprovedState();
}

class _ReplacementApprovedState extends State<ReplacementApproved> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarBoard(),
        drawer: const NavDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: CustomerDetails(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Installed Devices or Nodes',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(fontSize: 16)),
                  ),
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1)),
                      child: SizedBox(
                        width: 310,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aquesa Measure with Control',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                user.uid,
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 180,
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const ReplaceDevice()));
                                        },
                                        child: Text(
                                          'CHANGE REQUEST',
                                          style: GoogleFonts.notoSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const ScanDeviceorNode()));
                                        },
                                        child: Text(
                                          'UPDATE',
                                          style: GoogleFonts.notoSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1)),
                      child: SizedBox(
                        width: 310,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aquesa Measure with Control',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                user.uid,
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 160,
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const ReplaceDeviceorNode()));
                                        },
                                        child: Text(
                                          'REPLACE',
                                          style: GoogleFonts.notoSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const ScanDeviceorNode()));
                                        },
                                        child: Text(
                                          'UPDATE',
                                          style: GoogleFonts.notoSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
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
                                          const AddDevice()));
                            },
                            child: Text(
                              'ADD DEVICE',
                              style: GoogleFonts.notoSans(
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                            ))),
                  )
                ]),
          )),
        ));
  }
}
