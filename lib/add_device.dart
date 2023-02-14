import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/scan_device_node.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  String? _selectionItem1;
  String? _selectionItem2;

  final Map<String, List<String>> _dropdownValue = {
    'Water Management': [
      'Aquesa Measure',
      'Aquesa Measure and control',
      'Aquesa quality'
    ],
    'Home Automations': ['Wardeobe lock', 'Curtain control', 'Touch switch'],
  };

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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
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
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 2)),
                      child: SizedBox(
                        width: 256,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: DropdownButton<String>(
                            hint: const Text('Select Automations'),
                            elevation: 10,
                            borderRadius: BorderRadius.circular(15),
                            value: _selectionItem1,
                            onChanged: (value) {
                              setState(() {
                                _selectionItem1 = value;
                                _selectionItem2 = null;
                              });
                            },
                            items: _dropdownValue.keys
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 2)),
                      child: SizedBox(
                        width: 256,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: DropdownButton<String>(
                            hint: Text(
                              'Select above automations',
                              style: GoogleFonts.barlow(textStyle: const TextStyle()),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            value: _selectionItem2,
                            onChanged: (value) {
                              setState(() {
                                _selectionItem2 = value!;
                              });
                            },
                            items: _selectionItem1 == null
                                ? null
                                : _dropdownValue[_selectionItem1]!
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ScanDeviceorNode()));
                          // Navigator.pushNamed(context, '/ScanDeviceOrNode');
                        },
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 50,
                          color: Colors.black,
                        )),
                  )
                ]),
          )),
        ));
  }
}
