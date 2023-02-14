import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/drawer.dart';
import 'package:launch_ele/new_customer_otp.dart';
import 'package:launch_ele/search_device.dart';

const List<String> property = ['Soultree', 'Urban Nest', 'Engrace'];

class CustomerType extends StatefulWidget {
  const CustomerType({super.key});

  @override
  State<CustomerType> createState() => _CustomerTypeState();
}

class _CustomerTypeState extends State<CustomerType> {
  String dropProperty = property.first;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, actions: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset('assets/images/11111-hdpi.png',scale: 2),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                              side:  const BorderSide(
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
                                Icons.add,
                                size: 50,
                              )),
                            ),
                          )),
                      Text(
                        'New Customer',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
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
                              // Navigator.pushNamed(
                                  // context, '/SearchDevice');
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
                        'Existing Customer',
                        style: GoogleFonts.barlow(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Name',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Mobile',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Email',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            )),
                        child: SizedBox(
                          width: 350,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: DropdownButton(
                              value: dropProperty,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                              ),
                              style: GoogleFonts.barlow(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              onChanged: (String? value) {
                                setState(() {
                                  dropProperty = value!;
                                });
                              },
                              items: property.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Unit No.',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Address',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'PIN Code',
                            style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
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
                                      Icons.report_problem,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Customer Already Exists!',
                                      style: GoogleFonts.barlow(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: const Text(
                                        'Search for Customer with the Customer ID or Mobile No.'),
                                    /*actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'))
                                    ]*/
                                  ));
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const NewCustomerOTP()));
                          // Navigator.pushNamed(context, '/NewCustomerOTP');
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        label: Text(
                          'NEXT',
                          style: GoogleFonts.barlow(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.white)),
                        ))
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
