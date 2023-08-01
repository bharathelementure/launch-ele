// DashBoard List with devicetype customerID customertype

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfCustomers extends StatelessWidget {
  const ListOfCustomers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 454,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1),
          // itemCount: ,
          itemBuilder: (context, i) {
            return GridTile(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Card(
                      elevation: 15,
                      color: const Color(0xffE8DEF8),
                      /*shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(12)),*/
                      child: SizedBox(
                        width: 290,
                        height: 140,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Device Type:',
                                    style: GoogleFonts.notoSans(
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Text(
                                    'Aquesa Measure',
                                    style: GoogleFonts.notoSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Customer ID: ',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                'y9HFKn0YuPnt-2tfyDklotr',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Device ID: ',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                'ioP0-Dffhtyuioasdgwc-345',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Card(
                      elevation: 15,
                      color: const Color(0xffE8DEF8),
                      child: SizedBox(
                        width: 290,
                        height: 140,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Device Type:',
                                    style: GoogleFonts.notoSans(
                                        textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Text(
                                    'Aquesa Measure',
                                    style: GoogleFonts.notoSans(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Customer ID: ',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                'dfG90-njisfgnnc89n',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Device ID: ',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                'ghr0-io03lo-vbnjiasdg-kloert',
                                style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
