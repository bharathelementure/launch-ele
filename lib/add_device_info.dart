// import 'dart:io';

// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/device_with_info.dart';
import 'package:launch_ele/drawer.dart';

const List<String> homeShaft = [
  'Kitchen Shaft',
  'Utility Shaft',
  'WashRoom Shaft',
];

class AddDeviceInfo extends StatefulWidget {
  // final CameraDescription camera;
  const AddDeviceInfo({super.key});

  @override
  State<AddDeviceInfo> createState() => _AddDeviceInfoState();
}

class _AddDeviceInfoState extends State<AddDeviceInfo> {
  String dropShaft = homeShaft.first;
  // late CameraController _camController;

  /*late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    _camController = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _camController.initialize();
  }

  @override
  void dispose() {
    _camController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, actions: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset('assets/images/11111-hdpi.png', scale: 2),
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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'DEVICE / NODE INFORMATION',
                style: GoogleFonts.barlow(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Device Type:',
                    style: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Aquesa Measure with Control',
                    style: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Device ID:',
                    style: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    '95adgh58-m3j3opl-034klsvfgj',
                    style: GoogleFonts.barlow(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1)),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(
                    child: /*FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_camController);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),*/
                    Icon(
                      Icons.linked_camera_rounded,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),/*
              SizedBox(),
              IconButton(
                  onPressed: () async {
                    try {
                      await _initializeControllerFuture;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DisplayPicturScreen(imagePath: path)));
                    } catch (e) {
                      print(e);
                    }
                  },
                  icon: Icon(Icons.linked_camera_rounded)),*/
              const SizedBox(height: 30),
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
                          'Take a snap of the Installed Device as QR Code Visible.',
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
              Center(
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
                                      const DeviceWithInfo()));
                          // Navigator.pushNamed(context, '/DeviceWithInfo');
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
        ),
      )),
    );
  }
}
/*
class DisplayPicturScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPicturScreen({super.key,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the snap'),),
      body: Image.file(File(imagePath)),
    );
  }
}*/
