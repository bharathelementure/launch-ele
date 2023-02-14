import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/customer_type.dart';
import 'package:launch_ele/drawer.dart';

class SelectionOfDevice extends StatefulWidget {
  const SelectionOfDevice({super.key});

  @override
  State<SelectionOfDevice> createState() => _SelectionOfDeviceState();
}

class _SelectionOfDeviceState extends State<SelectionOfDevice> {

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
          Image.asset(
            'assets/images/11111-hdpi.png',
            scale: 2,
          ),
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
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
                        hint: Text('Select above automations',
                        style: GoogleFonts.barlow(textStyle: const TextStyle()),),
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
              const SizedBox(height: 50),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CustomerType()));
                    // Navigator.pushNamed(context, '/CustomerType');
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_rounded,
                    size: 50,
                    color: Colors.black,
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
