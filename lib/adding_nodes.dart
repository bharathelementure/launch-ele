import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/add_device_info.dart';
import 'package:launch_ele/device_id_list.dart';
import 'package:launch_ele/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:launch_ele/scan_device_node.dart';

class AddingNodes extends StatefulWidget {
  const AddingNodes({super.key, required this.scanedDevice});
  final String scanedDevice;

  @override
  State<AddingNodes> createState() => _AddingNodesState();
}

class _AddingNodesState extends State<AddingNodes> {
  final user = FirebaseAuth.instance.currentUser!;

  List devidList = [];

  Future getDeviceList() async {
    final rdata = {"customer_id": user.uid};
    final jsonString = json.encode(rdata);
    final uir = Uri.parse("http://192.168.0.126:8090/customer_details/");
    http.Response response;
    response = await http.post(uir, body: jsonString);
    print("response ${response.body}");
    if (response.statusCode == 200) {
      final deviidjso = json.decode(response.body);
      final rest = deviidjso["DeviceIDs"];
      // for (var i = 0; i < rest.length; i++) {
      //   print(rest[i]);
      // }
      // print("as List $rest");
      // scanedDivice = rest;
      setState(() {
        devidList = rest;
      });
      print("retur rest${rest[0]}");
      print(devidList);
      return devidList;
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  void initState() {
    getDeviceList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List deviList = devidList;
    return Scaffold(
      appBar: AppBar(centerTitle: false, actions: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset('assets/images/11111-hdpi.png', scale: 2),
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
                          style: GoogleFonts.notoSans(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Customer ID:',
                              style: GoogleFonts.notoSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ),
                            const Text('93rtio-Y34dfbji-yionm')
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
              style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(fontSize: 16)),
            ),
            Table(
                defaultColumnWidth: const FixedColumnWidth(162),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  const TableRow(children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Device ID',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Take a snap',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            widget.scanedDevice,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddDeviceInfo(
                                              snapDeviceId:
                                                  widget.scanedDevice)));
                            },
                            icon: const Icon(
                              Icons.linked_camera_rounded,
                              size: 30,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ]),
                ]),
            SizedBox(
              height: 250,
              child: DiviceIdList(
                  devidList: devidList, deviList: deviList, widget: widget),
            ),
            const SizedBox(height: 30),
            const Center(
              child: AddDevicebtn(),
            ),
          ],
        ),
      )),
    );
  }
}

class AddDevicebtn extends StatelessWidget {
  const AddDevicebtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 290,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ScanDeviceorNode()));
            },
            child: Text(
              'ADD DEVICE',
              style: GoogleFonts.notoSans(
                  textStyle:
                      const TextStyle(fontSize: 16, color: Colors.white)),
            )));
  }
}
