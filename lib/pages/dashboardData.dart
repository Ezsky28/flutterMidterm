import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/models/country_model.dart';
import 'package:flutter_project/pages/view_country.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class DashData extends StatefulWidget {
  @override
  State<DashData> createState() => _DashDataState();
}

class _DashDataState extends State<DashData> {
  Future<List<Country>> countryFuture = getCountry();

  static Future<List<Country>> getCountry() async {
    var url = Uri.parse("https://restcountries.com/v3.1/all");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Country.fromJsonList(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(173, 171, 171, 1),
      body: Center(
        child: FutureBuilder<List<Country>>(
          future: countryFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final countries = snapshot.data!;
              return buildCountry(countries);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildCountry(List<Country> countries) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CountryInfo(name: country.nameCommon.toString())));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              alignment: Alignment.topCenter,
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              height: 100,
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                      height: 94,
                      width: 126,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(country.flagPng!))),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    country.nameCommon!,
                    style: GoogleFonts.bebasNeue(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
