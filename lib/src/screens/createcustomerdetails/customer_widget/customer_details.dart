// Customer details with name and customer ID

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1)),
      child: SizedBox(
        width: 310,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Srinivas Rao M',
                style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Customer ID:',
                    style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                  ),
                  const Text('93rt56-Ft67io-123qwert'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
