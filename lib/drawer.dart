import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/dash_board.dart';
import 'package:launch_ele/new_customer_otp.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      backgroundColor: Colors.blue.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 80),
          Column(
            children: [
              const Icon(
                Icons.account_circle_rounded,
                size: 100,
              ),
              // Text(
              //   'Nagathihalli Bharath',
              //   style: GoogleFonts.notoSans(
              //       textStyle: const TextStyle(
              //           fontSize: 16, fontWeight: FontWeight.w600)),
              // ),
              Text(
                user.email!,
                style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ),
              // Text(
              //   user.phoneNumber!,
              //   style: GoogleFonts.notoSans(
              //       textStyle: const TextStyle(
              //           fontSize: 14, fontWeight: FontWeight.w500)),
              // ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text(
                  'Home',
                  style: GoogleFonts.notoSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                onTap: () async {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DashBoard();
                  }));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text(
                  'Add Customer',
                  style: GoogleFonts.notoSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                onTap: () async {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NewCustomerOTP();
                  }));
                },
              ),
              const SizedBox(height: 50),
              const Divider(
                color: Colors.black,
                thickness: 3,
                indent: 30,
                endIndent: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Reach Out Customer Care',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )),
              const Divider(
                color: Colors.black,
                thickness: 3,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    // Navigator.pop(context);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('SIGN OUT'))
            ],
          ),
        ],
      ),
    );
  }
}
