import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
          ),
          width: 350.0,
          height: 500.0,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                size: 200,
                color: Color.fromRGBO(0, 168, 181, 1),
              ),
              Text(
                'Name: John Doe',
                style: GoogleFonts.bebasNeue(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Email: JohnDoe@sample.com',
                style: GoogleFonts.bebasNeue(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
