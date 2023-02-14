import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/replace_approved.dart';
import 'package:launch_ele/replace_device.dart';
import 'package:launch_ele/scan_device_node.dart';

class WaitForApproval extends StatefulWidget {
  const WaitForApproval({super.key});

  @override
  State<WaitForApproval> createState() => _WaitForApprovalState();
}

class _WaitForApprovalState extends State<WaitForApproval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: false, actions: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('assets/images/11111-hdpi.png',scale: 2),
          ]),
        ]),
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
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1)),
                      child: SizedBox(
                        width: 310,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Srinivas Rao M',
                                style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Customer ID:',
                                    style: GoogleFonts.barlow(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  const Text('45a678b-njn8843-29843bna83')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Installed Devices or Nodes',
                    style: GoogleFonts.barlow(
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
                                style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                '95a54hij-oploserti-nm24560dgh',
                                style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        builder: (BuildContext context) =>
                                            const ReplaceDevice()));
                                          // Navigator.pushNamed(
                                              // context, '/ReplaceDevice');
                                        },
                                        child: Text(
                                          'CHANGE REQUEST',
                                          style: GoogleFonts.barlow(
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
                                        builder: (BuildContext context) =>
                                            const ScanDeviceorNode()));
                                          // Navigator.pushNamed(context, '/ScanDeviceOrNode');
                                        },
                                        child: Text(
                                          'UPDATE',
                                          style: GoogleFonts.barlow(
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
                                style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                '95a54hij-oploserti-nm24560dgh',
                                style: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 160,
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF788891)),
                                        onPressed: null,
                                        child: Text(
                                          'CHANGE REQUEST',
                                          style: GoogleFonts.barlow(
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
                                        builder: (BuildContext context) =>
                                            const ScanDeviceorNode()));
                                          //  Navigator.pushNamed(context, '/ScanDeviceOrNode');
                                        },
                                        child: Text(
                                          'UPDATE',
                                          style: GoogleFonts.barlow(
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
                                          const ReplacementApproved()));
                              // Navigator.pushNamed(context, '/ReplacemntApproved');
                            },
                            child: Text(
                              'ADD DEVICE',
                              style: GoogleFonts.barlow(
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                            ))),
                  )
                ]),
          )),
        ));
  }
}