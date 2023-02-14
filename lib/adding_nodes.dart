import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/scan_device_node.dart';

class AddingNodes extends StatefulWidget {
  const AddingNodes({super.key});

  @override
  State<AddingNodes> createState() => _AddingNodesState();
}

class _AddingNodesState extends State<AddingNodes> {
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
          child: Padding(
        padding: const EdgeInsets.all(18.0),
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
                                  fontSize: 16, fontWeight: FontWeight.w600)),
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
            const SizedBox(height: 30),
            Text(
              'Installed Devices or Nodes',
              style:
                  GoogleFonts.barlow(textStyle: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 50),
            const Center(
              child: Icon(
                Icons.info,
                size: 50,
                color: Colors.black,
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 100,
                child: Text(
                  'No Nodes/Devices has been Installed',
                  style: GoogleFonts.barlow(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                  textAlign: TextAlign.center,
                ),
              ),
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
                                          const ScanDeviceorNode()));
                        // Navigator.pushNamed(context, '/ScanDeviceOrNode');
                      },
                      child: Text(
                        'ADD DEVICE',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                      ))),
            )
          ],
        ),
      )),
    );
  }
}
