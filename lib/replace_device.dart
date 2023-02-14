import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/wait_forapproval.dart';

enum SingingCharacter { physicaDamage, batteryDamage, powerIssue, networkIssue }

class ReplaceDevice extends StatefulWidget {
  const ReplaceDevice({super.key});

  @override
  State<ReplaceDevice> createState() => _ReplaceDeviceState();
}

class _ReplaceDeviceState extends State<ReplaceDevice> {
  SingingCharacter? _character = SingingCharacter.physicaDamage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, actions: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         Image.asset('assets/images/11111-hdpi.png',scale: 2),
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
                    value: SingingCharacter.physicaDamage,
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
              const SizedBox(height: 30),
              const Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1)),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(
                    child: Icon(
                      Icons.linked_camera_rounded,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
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
}
