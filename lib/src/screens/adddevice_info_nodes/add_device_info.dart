// Take the snap of the installed device

import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:launch_ele/src/screens/device_info/device_with_info.dart';
import 'package:http/http.dart' as http;
import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddDeviceInfo extends StatefulWidget {
  const AddDeviceInfo({super.key, required this.snapDeviceId});
  final String snapDeviceId;

  @override
  State<AddDeviceInfo> createState() => _AddDeviceInfoState();
}

String? snapDeviceId;

class _AddDeviceInfoState extends State<AddDeviceInfo> {
  /*Future snapDevice() async {
    var bytes = File(selectedImagePath).readAsBytesSync();
    String img64 = base64.encode(bytes);
    final rdata = {
      "customer_id": user.uid,
      "device_id": widget.snapDeviceId,
      "picture": img64,
    };
    print(rdata);
    final jsonString = json.encode(rdata);
    final uir = Uri.parse("http://192.168.0.126:8090/upload/");
    http.Response response;
    response = await http.post(uir, body: jsonString);
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        snapDeviceId = response.body;
      });
      return response.toString();
    } else {
      return const CircularProgressIndicator();
    }
  }*/

  // Localy host api
  Future snapDevice() async {
    var bytes = File(selectedImagePath).readAsBytesSync();
    String img64 = base64.encode(bytes);
    try {
      final rdata = {
        "customer_id": user.uid,
        "device_id": widget.snapDeviceId,
        "picture": img64,
      };
      final jsonString = json.encode(rdata);
      final uri = Uri.parse("http://192.168.0.126:8090/upload/");

      http.Response response;
      response = await http.post(uri, body: jsonString);

      if (response.statusCode == 200) {
        setState(() {
          snapDeviceId = response.body;
        });
        print(snapDeviceId);
        print("API request successful");
        return response.toString();
      } else {
        Fluttertoast.showToast(
            msg: "API request failed with status code: ${response.statusCode}");
        print("API request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "API request failed with status code: $e");
      print("An error occurred: $e");
      if (e is SocketException) {
        Fluttertoast.showToast(msg: "No internet connection");
        print("No internet connection");
        // Handle no internet connection here
      } else {
        const CircularProgressIndicator();
      }
    }
  }

  final user = FirebaseAuth.instance.currentUser!;
  final List<String> homeShaftItems = [
    'Kitchen Shaft',
    'Utility Shaft',
    'WashRoom Shaft'
  ];

  String? selectedValue;
  String selectedImagePath = "";
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
      appBar: const AppBarBoard(),
      // drawer: const NavDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'DEVICE / NODE INFORMATION',
                style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Device Type: ',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Aquesa Measure with Control',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Device ID:${widget.snapDeviceId}',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Selecting of snap from camera
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedImagePath == ''
                        ? const Icon(
                            Icons.image_sharp,
                            size: 150,
                            color: Colors.black,
                          )
                        : Image.file(
                            File(selectedImagePath),
                            height: 230,
                            width: 230,
                            fit: BoxFit.fill,
                          ),
                    IconButton(
                        onPressed: () async {
                          selectImage();
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.linked_camera_rounded,
                          size: 50,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38, right: 38),
                      child: SizedBox(
                        width: 180,
                        height: 75,
                        child: Text(
                          'Take a snap of the Installed Device as QR Code Visible.',
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Selection of Shafts to the instaled device
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: Text('Select Shafts',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(fontSize: 14))),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: homeShaftItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select shaft.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    print(selectedValue);
                  });
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              const SizedBox(height: 10),
              // ElevatedButton
              Center(
                child: SizedBox(
                    height: 50,
                    width: 290,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        onPressed: () {
                          snapDevice();
                          selectedImagePath == ""
                              ? Fluttertoast.showToast(
                                  msg:
                                      'Please take the snap \n of installed device')
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const DeviceWithInfo()));
                        },
                        child: Text(
                          'ADD DEVICE',
                          style: GoogleFonts.notoSans(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.white)),
                        ))),
              )
            ],
          ),
        ),
      )),
    );
  }

// Sizeing the image width and height from selectImageFromCamera
  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const Text('Select Image From !'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No Image Saelected !')));
                            }
                          },
                          child: const Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.linked_camera_outlined,
                                    size: 50,
                                  ),
                                  Text('Camera')
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

// package used ImagePicker
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    // print('image;- ${file!.name}');
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
