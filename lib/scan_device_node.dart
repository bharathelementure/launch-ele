// import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/add_device_info.dart';
import 'package:launch_ele/drawer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanDeviceorNode extends StatefulWidget {
  const ScanDeviceorNode({super.key});

  @override
  State<ScanDeviceorNode> createState() => _ScanDeviceorNodeState();
}

class _ScanDeviceorNodeState extends State<ScanDeviceorNode> {
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
            /*Text('Launch.',
                style: GoogleFonts.caveat(
                  textStyle: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
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
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 300,
                  width: 300,
                  child: QRView(key: _globalKey, onQRViewCreated: qr)),
              Center(
                child: (result != null)
                    ? Text("Barcode Type: ${describeEnum(result!.format)} "
                        "Data: ${result!.code}")
                    : Text(
                        "Tap to scan",
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Serial No.',
                    hintStyle: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))),
              ),
              const SizedBox(height: 20),
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
                        // Navigator.pushNamed(context, '/AddDeviceInfo');
                      },
                      child: Text(
                        'ADD DEVICE',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                      ))),
            ),
            ]),
          ),
        )));
  }
}
