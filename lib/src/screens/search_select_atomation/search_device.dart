// Search the customer by customerID or mobileNO.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/src/screens/device_info/device_with_info.dart';
import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
import 'package:launch_ele/src/screens/appbar.dart/drawer.dart';

enum SingingCharacter { lafayette }

class SearchDevice extends StatefulWidget {
  const SearchDevice({super.key});

  @override
  State<SearchDevice> createState() => _SearchDeviceState();
}

class _SearchDeviceState extends State<SearchDevice> {
  final user = FirebaseAuth.instance.currentUser!;
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool selectsigingCharacter = true;

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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Search by Customer ID or Mobile No.',
                            style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 20),
                          const TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '90034890503',
                              prefixIcon: Icon(
                                Icons.search,
                                size: 40,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            shape: const RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.black, width: 1)),
                            child: SizedBox(
                              width: 255,
                              height: 220,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Srinivas Rao M',
                                      style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text(
                                      'Customer ID:',
                                      style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    Text(
                                      user.uid,
                                      style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mobile No:',
                                              style: GoogleFonts.notoSans(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                            Text(
                                              '9535047484',
                                              style: GoogleFonts.notoSans(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 8),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Email ID',
                                              style: GoogleFonts.notoSans(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                            Text(
                                              'Srinivas.rao@gmail.com',
                                              style: GoogleFonts.notoSans(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Property:',
                                      style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    Text(
                                      'B-102, Engrace by ModernSpaces Sarjapur Road, Banglore - 562162',
                                      style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    ListTile(
                                      title: const Text(''),
                                      leading: Radio<SingingCharacter>(
                                          toggleable: selectsigingCharacter,
                                          value: SingingCharacter.lafayette,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          }),
                                    ),
                                  ],
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
                                    },
                                    child: Text(
                                      'NEXT',
                                      style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ))),
                          )
                        ])))));
  }
}
