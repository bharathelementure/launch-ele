import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/add_device_info.dart';
import 'package:launch_ele/api/scan_device_id.dart';
import 'package:launch_ele/drawer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ReplaceDeviceorNode extends StatefulWidget {
  const ReplaceDeviceorNode({super.key});

  get scanedDevice => null;

  @override
  State<ReplaceDeviceorNode> createState() => _ReplaceDeviceorNodeState();
}

class _ReplaceDeviceorNodeState extends State<ReplaceDeviceorNode> {
  final user = FirebaseAuth.instance.currentUser!;
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
            Image.asset('assets/images/11111-hdpi.png', scale: 2),
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
                                        style: GoogleFonts.notoSans(
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
                                            style: GoogleFonts.notoSans(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const Text('9034oi-tYoplsdf-234dfgr')
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
                                      ]),
                                )),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Scan the New Node or Device',
                            style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(fontSize: 16)),
                          ),
                          Center(
                            child: SizedBox(
                                height: 250,
                                width: 250,
                                child: QRView(
                                    key: _globalKey, onQRViewCreated: qr)),
                          ),
                          Center(
                            child: (result != null)
                                ? Text(
                                    "Barcode Type: ${describeEnum(result!.format)} "
                                    "Data: ${result!.code}")
                                : Text(
                                    "Tap to scan",
                                    style: GoogleFonts.notoSans(
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
                                hintStyle: GoogleFonts.notoSans(
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
                                      scandDeviceId();
                                      result?.code == null
                                          ? Fluttertoast.showToast(
                                              msg: 'Please Scan the Qr-Code!')
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      AddDeviceInfo(
                                                          snapDeviceId: result!
                                                              .code
                                                              .toString())));
                                    },
                                    child: Text(
                                      'ADD DEVICE',
                                      style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ))),
                          ),
                        ])))));
  }
}
