import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/search_device.dart';
import 'package:launch_ele/selection_of_device.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
   bool _hasInternet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(centerTitle: false,
      backgroundColor: Colors.lightGreen.shade100,
       actions: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset('assets/images/11111-hdpi.png', scale: 2),
        ]),
      ]),
      drawer: const NavDrawer(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(elevation: 10,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SelectionOfDevice()));
                            // Navigator.pushNamed(
                            // context, '/SelectionOfDevice');
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
                      style: GoogleFonts.barlow(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(elevation: 10,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SearchDevice()));
                            // Navigator.pushNamed(context, '/SearchDevice');
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
                      'Find Device',
                      style: GoogleFonts.barlow(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(elevation: 10,
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.black, width: 2),
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
                      style: GoogleFonts.barlow(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Recent Activities',
              style: GoogleFonts.barlow(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 20),
            SizedBox(height: 436,
            // width: double.infinity,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, i) {
                    return GridTile(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Card(elevation: 15,
                            color: const Color(0xffE8DEF8),
                              /*shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12)),*/
                              child: SizedBox(
                                width: 290,
                                height: 130,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Device Type:',
                                            style: GoogleFonts.barlow(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          Text(
                                            'Aquesa Measure',
                                            style: GoogleFonts.barlow(
                                                textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Customer ID: ',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text(
                                        '63nbbu8994rnja-99823nvsnunjvn90',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Device ID: ',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text(
                                        '63nbbu8994rnja-99823nvsnunjvn90',
                                        style: GoogleFonts.barlow(
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
                            child: Card(elevation: 15,
                            color: const Color(0xffE8DEF8),
                            // shadowColor: Color(0x007B6A81),
                              /*shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12)),*/
                              child: SizedBox(
                                width: 290,
                                height: 130,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Device Type:',
                                            style: GoogleFonts.barlow(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          Text(
                                            'Aquesa Measure',
                                            style: GoogleFonts.barlow(
                                                textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Customer ID: ',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text(
                                        '63nbbu8994rnja-99823nvsnunjvn90',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Device ID: ',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text(
                                        '63nbbu8994rnja-99823nvsnunjvn90',
                                        style: GoogleFonts.barlow(
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
                          /*const SizedBox(height: 10),
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: SizedBox(
                                width: 270,
                                height: 110,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Device Type:',
                                            style: GoogleFonts.barlow(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          Text(
                                            'Aquesa Measure',
                                            style: GoogleFonts.barlow(
                                                textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      ),
                                      Text(
                                        'Customer ID: ',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text(
                                        '63nbbu8994rnja-99823nvsnunjvn90',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      Text(
                                        'Device ID: ',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text(
                                        '63nbbu8994rnja-99823nvsnunjvn90',
                                        style: GoogleFonts.barlow(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
