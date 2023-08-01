// Creation of New customer

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_ele/src/screens/appbar.dart/app_bar_board.dart';
import 'package:launch_ele/src/screens/appbar.dart/drawer.dart';
import 'package:launch_ele/src/screens/createcustomerdetails/new_customer_otp.dart';
import 'package:launch_ele/src/screens/createcustomerdetails/customer_widget/otp_valid.dart';
import 'package:launch_ele/src/screens/search_select_atomation/search_device.dart';

class CustomerType extends StatefulWidget {
  const CustomerType({super.key});

  static String verify = "";

  @override
  State<CustomerType> createState() => _CustomerTypeState();
}

class _CustomerTypeState extends State<CustomerType> {
  final List<String> propertyItems = [
    'Soultree',
    'Urban Nest',
    'Engrace',
    'Others'
  ];

  String? selectedValue;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  FirebaseDatabase databasae = FirebaseDatabase.instance;
  var phone = '';

  @override
  void initState() {
    mobileController.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBoard(),
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
                                Icons.add,
                                size: 50,
                              )),
                            ),
                          )),
                      Text(
                        'New Customer',
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
                        style: GoogleFonts.notoSans(
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Name',
                            style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Mobile',
                            style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Email',
                            style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select the property',
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
                      items: propertyItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select property';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          // print(selectedValue);
                        });
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                        // print(selectedValue);
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text(
                            'Unit No.',
                            style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          )),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        verifyPhoneNumber();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                  icon: const Icon(
                                    Icons.report_problem,
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'Customer Already Exists!',
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                      'Search for Customer with the Customer ID or Mobile No.'),
                                ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const NewCustomerOTP()));
                      },
                      child: Text(
                        'NEXT',
                        style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  // Phone number otp
  Future verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileController.text + phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(
            msg: "Please Enter a Valid Number",
            fontSize: 18,
            backgroundColor: const Color(0xFF2292D7),
            textColor: const Color(0xFFFFFFFF));
      },
      codeSent: (String verificationId, int? resendToken) {
        CustomerType.verify = verificationId;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const OTPValid()));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
