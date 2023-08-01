// Selection of automation and add the selected automation to the added customer

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
import 'package:launch_ele/src/screens/appbar.dart/drawer.dart';
import 'package:launch_ele/src/screens/Scan_device/scan_device_node.dart';
import 'package:launch_ele/src/screens/createcustomerdetails/customer_widget/customer_details.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final user = FirebaseAuth.instance.currentUser!;
  String? _selectionItem1;
  String? _selectionItem2;

// DropDown List value
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
        appBar: const AppBarBoard(),
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
                  const Center(
                    child: CustomerDetails(),
                    /*Card(
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
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
                                  const Text(
                                    '934uio9_345rt-231190Fy',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),*/
                  ),
                  const SizedBox(height: 30),
                  // DropDown list with main
                  DropdownButtonFormField2(
                    value: _selectionItem1,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Automations',
                      style: TextStyle(fontSize: 14),
                    ),
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
                    items: _dropdownValue.keys
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                  ),
                                ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Automations';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectionItem1 = value;
                        _selectionItem2 = null;
                      });
                    },
                    onSaved: (value) {
                      _selectionItem1 = value.toString();
                    },
                  ),
                  const SizedBox(height: 30),
                  // DropDown list with submain
                  DropdownButtonFormField2(
                    value: _selectionItem2,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Automations',
                      style: TextStyle(fontSize: 14),
                    ),
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
                    items: _selectionItem1 == null
                        ? null
                        : _dropdownValue[_selectionItem1]!
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    ))
                            .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Automations';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectionItem2 = value!;
                      });
                    },
                    onSaved: (value) {
                      _selectionItem2 = value.toString();
                    },
                  ),
                  const SizedBox(height: 50),
                  // IconButton to ScanDeviceId
                  Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ScanDeviceorNode()));
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
