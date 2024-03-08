import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_project/pages/settings.dart';
import 'package:flutter_project/dashboard.dart';
import 'dart:convert';

class CountryInfo extends StatefulWidget {
  final String name;

  static const String routeName = "country_info";
  CountryInfo({required this.name});

  @override
  State<CountryInfo> createState() => _CountryInfoState();
}

class _CountryInfoState extends State<CountryInfo> {
  Future<Map<String, dynamic>> fetchCountryData() async {
    final response = await http.get(
      Uri.parse('https://restcountries.com/v3.1/name/${widget.name}'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      if (data.isNotEmpty) {
        return data[0];
      } else {
        throw Exception('No data available for the entered country name.');
      }
    } else {
      throw Exception('Failed to load country data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(173, 171, 171, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 53, 53, 1),
        automaticallyImplyLeading: false,
        title: Image(image: AssetImage('assets/appbar.png')),
        centerTitle: true,
        actions: [IconButton(onPressed: settings, icon: Icon(Icons.settings))],
        leading: IconButton(onPressed: dashboard, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchCountryData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              Map<String, dynamic> countryData = snapshot.data!;
              String flagUrl = countryData['flags']['png'];
              double landArea = countryData['area'] ?? 0.0;
              int population = countryData['population'];
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                  ),
                  width: 350.0,
                  height: 500.0,
                  alignment: Alignment.center, // where to position the child
                  child: Column(
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        countryData['name']['common'],
                        style: GoogleFonts.bebasNeue(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              width: 335.0,
                              height: 180.0,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(flagUrl))),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Official Name:',
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            countryData['name']['official'],
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Region:',
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            countryData['region'],
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Subregions:',
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            countryData['subregion'] ?? 'No Subregion',
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Land Area',
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            landArea.toString(),
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Population:',
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            population.toString(),
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Continent:',
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            countryData['continents'][0],
                            style: GoogleFonts.bebasNeue(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  void settings() {
    Navigator.pushNamed(context, Settings.routeName);
  }

  void dashboard() {
    Navigator.pushNamed(context, Dashboard.routeName);
  }
}
