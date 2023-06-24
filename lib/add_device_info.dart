import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:launch_ele/device_with_info.dart';
import 'package:http/http.dart' as http;
import 'package:launch_ele/drawer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddDeviceInfo extends StatefulWidget {
  const AddDeviceInfo({super.key, required this.snapDeviceId});
  final String snapDeviceId;

  @override
  State<AddDeviceInfo> createState() => _AddDeviceInfoState();
}

String? snapDeviceId;

class _AddDeviceInfoState extends State<AddDeviceInfo> {
  Future snapDevice() async {
    var bytes = File(selectedImagePath).readAsBytesSync();
    String img64 = base64.encode(bytes);
    final rdata = {
      "customer_id": user.uid,
      "device_id": widget.snapDeviceId,
      "picture": img64
      // selectedImagePath.split('/').last
    };
    print(rdata);
    final jsonString = json.encode(rdata);
    final uir = Uri.parse("http://192.168.0.126:8090/upload");
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
  }

  /*snapDevice() async {
    final rdata = {"customer_id": user.uid, "device_id": widget.snapDeviceId};
    final jsonString = json.encode(rdata);
    final url = Uri.parse("http://192.168.0.126:8090/upload_image/");

    var reque = http.MultipartRequest("POST", url)
      ..fields["customer"] = user.uid
      ..fields["device_id"] = widget.snapDeviceId
      ..files
          .add(await http.MultipartFile.fromPath('image', selectedImagePath));
    var response = await reque.send();
    if (response.statusCode == 200) {
      print(response);
      print("Uploaded");
    } else {
      print("Failed");
    }
    // request.send().then((response) {
    //   if (response.statusCode == 200) {
    //     print(response);
    //     print("Uploaded");
    //   } else {
    //     print("Failed");
    //   }
    // });
  }*/

  /*openImage() async {
    try {
      var pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 100);
      if (pickedFile != null) {
        imagepath = pickedFile.path;
        print(imagepath);

        File imagefile = File(imagepath);
        Uint8List imagebytes = await imagefile.readAsBytes();
        String base64string = base64.encode(imagebytes);
        print(base64string);

        // Unit8List decodebytes = base64.decode(base64string);

        setState(() {});
      } else {
        print("No image is selected!");
      }
    } catch (e) {
      print('error while picking a file.');
    }
  }*/

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
                  // Text(
                  //   widget.snapDeviceId,
                  //   style: GoogleFonts.notoSans(
                  //       textStyle: const TextStyle(
                  //           fontSize: 12, fontWeight: FontWeight.w600)),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
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
                onChanged: (value) {},
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              /*Center(
                child: Card(
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2)),
                  child: SizedBox(
                    width: 216,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: DropdownButton(
                        value: dropShaft,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        ),
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        onChanged: (String? value) {
                          setState(() {
                            dropShaft = value!;
                          });
                        },
                        items: homeShaft
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),*/
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                    height: 50,
                    width: 290,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        onPressed: () {
                          snapDevice();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const DeviceWithInfo()));
                          // Navigator.pushNamed(context, '/DeviceWithInfo');
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
                            // print(
                            //     'Image_path:- ${selectedImagePath.characters}');
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
