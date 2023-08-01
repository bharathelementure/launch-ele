// Scan Device to add in list

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/src/screens/adddevice_info_nodes/adding_nodes.dart';
import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanDeviceorNode extends StatefulWidget {
  const ScanDeviceorNode({super.key});

  @override
  State<ScanDeviceorNode> createState() => _ScanDeviceorNodeState();
}

String? scanedDivice;

class _ScanDeviceorNodeState extends State<ScanDeviceorNode> {
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

  Future scandDeviceId() async {
    final rdata = {"customer_id": user.uid, "device_id": "${result!.code}"};
    final jsonString = json.encode(rdata);
    final uir = Uri.parse("http://192.168.0.126:8070/CustomerIDs");
    http.Response response;
    response = await http.post(uir, body: jsonString);
    // print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        scanedDivice = response.body;
      });
      // print(scanedDivice);
      return response.toString();
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarBoard(),
        // drawer: const NavDrawer(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Qr_code scanner view
              SizedBox(
                  height: 300,
                  width: 300,
                  child: QRView(
                      key: _globalKey,
                      onQRViewCreated: qr,
                      overlay: QrScannerOverlayShape(
                          borderRadius: 10,
                          borderWidth: 5,
                          borderColor: Colors.white))),
              Center(
                child: (result != null)
                    ? Text("Barcode Type: ${describeEnum(result!.format)} "
                        "Data: ${result!.code}")
                    : Text(
                        "Tap to scan",
                        style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Serial No.',
                    hintStyle: GoogleFonts.notoSans(
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
                          scandDeviceId();
                          result?.code == null
                              ? Fluttertoast.showToast(
                                  msg: 'Please Scan the Qr-Code!')
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddingNodes(
                                            scanedDevice:
                                                result!.code.toString(),
                                          )));
                        },
                        child: Text(
                          'ADD DEVICE',
                          style: GoogleFonts.notoSans(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.white)),
                        ))),
              ),
            ]),
          ),
        )));
  }
}
