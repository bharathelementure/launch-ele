import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/wait_forapproval.dart';

enum SingingCharacter { physicalDamage, batteryDamage, powerIssue, networkIssue }

class ReplaceDevice extends StatefulWidget {
  const ReplaceDevice({super.key});

  @override
  State<ReplaceDevice> createState() => _ReplaceDeviceState();
}

class _ReplaceDeviceState extends State<ReplaceDevice> {
  SingingCharacter? _character = SingingCharacter.physicalDamage;
  String selectedImagePath = "";

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
            children: [
              ListTile(
                title: const Text('Physical Damage'),
                leading: Radio<SingingCharacter>(
                    value: SingingCharacter.physicalDamage,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
              ),
              ListTile(
                title: const Text('Battery Damage'),
                leading: Radio<SingingCharacter>(
                    value: SingingCharacter.batteryDamage,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
              ),
              ListTile(
                title: const Text('Power Issue'),
                leading: Radio<SingingCharacter>(
                    value: SingingCharacter.powerIssue,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
              ),
              ListTile(
                title: const Text('Network Issue'),
                leading: Radio<SingingCharacter>(
                    value: SingingCharacter.networkIssue,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedImagePath == ''
                        ?  const Icon(
                            Icons.image_sharp,
                            size: 150,
                            color: Colors.black,
                          )
                        : Image.file(
                            File(selectedImagePath),
                            height: 250,
                            width: 250,
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
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 58, right: 58),
                      child: SizedBox(
                        width: 180,
                        height: 100,
                        child: Text(
                          'Take a snap of the Installed Device, Damage Visible if Possible..',
                          style: GoogleFonts.barlow(
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
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                    height: 50,
                    width: 290,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    icon: const Icon(
                                      Icons.pause_circle,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Request Raised: 11142564 is your service request number.',
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    content: const Text(
                                        'Kindley Reach us on +919008900855 for Immediate Replacement'),
                                  ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const WaitForApproval()));
                          // Navigator.pushNamed(context, '/WaitForApproval');
                        },
                        child: Text(
                          'REQUESTE TO REPLACE',
                          style: GoogleFonts.barlow(
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
                        /*GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_path:-');
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No Image Selected !')));
                            }
                          },
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: const [
                                  Icon(Icons.linked_camera_rounded, size: 50),
                                  Text('Gallery')
                                ],
                              ),
                            ),
                          ),
                        ),*/
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_path:-');
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No Image Saelected !')));
                            }
                          },
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: const [
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

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}

