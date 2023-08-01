// Chossing off addcutomer or searchcustomer and gateway

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/src/screens/search_select_atomation/search_device.dart';
import 'package:launch_ele/src/screens/search_select_atomation/selection_of_device.dart';

class SearchAddBar extends StatelessWidget {
  const SearchAddBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SelectionOfDevice()));
                  },
                  child: const SizedBox(
                    width: 70,
                    height: 70,
                    child: Center(
                        child: Icon(
                      Icons.add,
                      size: 50,
                    )),
                  ),
                )),
            Text(
              'Install New',
              style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SearchDevice()));
                  },
                  child: const SizedBox(
                    width: 70,
                    height: 70,
                    child: Center(
                        child: Icon(
                      Icons.search,
                      size: 50,
                    )),
                  ),
                )),
            Text(
              'Customer ID',
              style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
                elevation: 10,
                color: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.hardEdge,
                child: const InkWell(
                  onTap: null,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Center(
                        child: Icon(
                      Icons.router_outlined,
                      size: 50,
                      color: Colors.grey,
                    )),
                  ),
                )),
            Text(
              'Gateway',
              style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            )
          ],
        )
      ],
    );
  }
}
