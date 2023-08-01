import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/src/screens/appbar.dart/drawer.dart';
import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
import 'package:launch_ele/src/screens/dashBoard/dashwidgets/dash_listofcustomerdetails.dart';
import 'package:launch_ele/src/screens/dashBoard/dashwidgets/dash_searchaddBar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBoard(),
      drawer: const NavDrawer(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchAddBar(),
            const SizedBox(height: 15),
            Text(
              'Recent Activities',
              style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 15),
            const ListOfCustomers()
          ],
        ),
      )),
    );
  }
}
