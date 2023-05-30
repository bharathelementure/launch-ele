import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:launch_ele/customer_type.dart';
import 'package:launch_ele/drawer.dart';

class SelectionOfDevice extends StatefulWidget {
  const SelectionOfDevice({super.key});

  @override
  State<SelectionOfDevice> createState() => _SelectionOfDeviceState();
}

class _SelectionOfDeviceState extends State<SelectionOfDevice> {
  /*bool isOpen = false;
  // custmized drop down button
  String selectProperty = 'Select Automations';
  String selectPropertys = 'Select Above Automations';*/

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
      // backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
          centerTitle: false,
          // backgroundColor: Colors.lightGreen.shade100,
          actions: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                'assets/images/11111-hdpi.png',
                scale: 2,
              ),
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
              // Customized drop down button
              /*Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        isOpen = !isOpen;
                        setState(() {});
                      },
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(color: Colors.black)),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectProperty,
                                  style: GoogleFonts.barlow(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Icon(isOpen
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (isOpen)
                      ListView(
                          primary: true,
                          shrinkWrap: true,
                          children: _dropdownValue.keys
                              .map((e) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: InkWell(
                                        onTap: () {
                                          selectProperty = e;
                                          _selectionItem1 = e;
                                          _selectionItem2 = null;
                                          isOpen = false;
                                          setState(() {
                                            _selectionItem1 = e;
                                            _selectionItem2 = null;
                                          });
                                        },
                                        child: Text(
                                          e,
                                          style: GoogleFonts.barlow(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList())
                  ],
                ),
              ),*/
              DropdownButtonFormField2(
                value: _selectionItem1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffE7E0EC),
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
                icon: const Icon(Icons.arrow_drop_down),
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
                    print(_dropdownValue);
                    print(_selectionItem1);
                    _selectionItem1 = value;
                    _selectionItem2 = null;
                  });
                },
                onSaved: (value) {
                  _selectionItem1 = value.toString();
                  print(_selectionItem1);
                },
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField2(
                value: _selectionItem2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffE7E0EC),
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
                    print(_selectionItem2);
                  });
                },
                onSaved: (value) {
                  _selectionItem2 = value.toString();
                },
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
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
