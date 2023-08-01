import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final user = FirebaseAuth.instance.currentUser!;

Future scandDeviceId() async {
  var result;
  final rdata = {"customer_id": user.uid, "device_id": "${result!.code}"};
  final jsonString = json.encode(rdata);
  final uir = Uri.parse("http://192.168.0.126:8070/CustomerIDs");
  http.Response response;
  response = await http.post(uir, body: jsonString);
  print(response.body);
  if (response.statusCode == 200) {
    // setState(() {
    //   scanedDivice = response.body;
    // });
    // print(scanedDivice);
    return response.toString();
  } else {
    return const CircularProgressIndicator();
  }
}
