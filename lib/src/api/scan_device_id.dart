import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

final user = FirebaseAuth.instance.currentUser!;

/*Future scandDeviceId() async {
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
}*/
// Localy host api
Future scandDeviceId() async {
  var result;
  try {
    final rdata = {"customer_id": user.uid, "device_id": "${result!.code}"};
    final jsonString = json.encode(rdata);
    final uri = Uri.parse("http://192.168.0.136:8090/CustomerIDs");

    http.Response response;
    response = await http.post(uri, body: jsonString);

    if (response.statusCode == 200) {
      // setState(() {
      //   scanedDivice = response.body;
      // });
      print("API request successful");
      return response.toString();
    } else {
      Fluttertoast.showToast(
          msg: "API request failed with status code: ${response.statusCode}");
      print("API request failed with status code: ${response.statusCode}");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "API request failed with status code: $e");
    print("An error occurred: $e");
    if (e is SocketException) {
      Fluttertoast.showToast(msg: "No internet connection");
      print("No internet connection");
      // Handle no internet connection here
    } else {
      const CircularProgressIndicator();
    }
  }
}
