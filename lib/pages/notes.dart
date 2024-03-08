import 'package:flutter/material.dart';
import 'package:flutter_project/pages/note_file.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<String> countryNames = [];
  String selectedCountry = '';

  @override
  void initState() {
    super.initState();
    fetchCountryNames();
  }

  Future<void> fetchCountryNames() async {
    final response = await http.get(
      Uri.parse('https://restcountries.com/v3.1/all'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<String> names =
          data.map((country) => country['name']['common'].toString()).toList();

      setState(() {
        countryNames = names;
        selectedCountry = countryNames.isNotEmpty ? countryNames[0] : '';
      });
    } else {
      throw Exception('Failed to load country data');
    }
  }

  List notesList = [];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      notesList[index][1] = !notesList[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      notesList.removeAt(index);
    });
  }

  void saveNewToKnow() {
    setState(() {
      notesList.add([selectedCountry, false]);
    });
    Navigator.of(context).pop();
  }

  void createNewToKnow() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade300,
            content: Container(
              height: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Which country do you want to know?',
                    style: GoogleFonts.bebasNeue(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 168, 181, 1),
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 168, 181, 1),
                                width: 2))),
                    isExpanded: true,
                    value: selectedCountry,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue!;
                      });
                    },
                    items: countryNames
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(child: Text(value)),
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: saveNewToKnow,
                        color: Color.fromRGBO(0, 168, 181, 1),
                        child: Text('SAVE'),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      MaterialButton(
                        onPressed: () => Navigator.of(context).pop(),
                        color: Color.fromRGBO(0, 168, 181, 1),
                        child: Text('CANCEL'),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(173, 171, 171, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(0, 168, 181, 1),
        onPressed: createNewToKnow,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          return NotesFile(
            Country: notesList[index][0],
            taskCompleted: notesList[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
