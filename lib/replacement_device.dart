import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/add_device_info.dart';
import 'package:launch_ele/drawer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ReplaceDeviceorNode extends StatefulWidget {
  const ReplaceDeviceorNode({super.key});

  @override
  State<ReplaceDeviceorNode> createState() => _ReplaceDeviceorNodeState();
}

class _ReplaceDeviceorNodeState extends State<ReplaceDeviceorNode> {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

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
                          Center(
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black, width: 1)),
                              child: SizedBox(
                                width: 310,
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Srinivas Rao M',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Customer ID:',
                                            style: GoogleFonts.barlow(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const Text(
                                              '45a678b-njn8843-29843bna83')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: const RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.black, width: 1)),
                            child: SizedBox(
                                width: 310,
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      ]),
                                )),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Scan the New Node or Device',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(fontSize: 16)),
                          ),
                          Center(
                            child: SizedBox(
                                height: 250,
                                width: 250,
                                child:
                                    QRView(key: _globalKey, onQRViewCreated: qr)),
                          ),
                          Center(
                            child: (result != null)
                                ? Text(
                                    "Barcode Type: ${describeEnum(result!.format)} "
                                    "Data: ${result!.code}")
                                : Text(
                                    "Tap to scan",
                                    style: GoogleFonts.barlow(
                                        textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: 'Serial No.',
                                hintStyle: GoogleFonts.barlow(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))),
                          ),
                          const SizedBox(height: 10),
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
                                          const AddDeviceInfo()));
                                      // Navigator.pushNamed(
                                          // context, '/AddDeviceInfo');
                                    },
                                    child: Text(
                                      'ADD DEVICE',
                                      style: GoogleFonts.barlow(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ))),
                          ),
                        ])))));
  }
}
