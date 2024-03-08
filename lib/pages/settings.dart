import 'package:flutter/material.dart';
import 'package:flutter_project/dashboard.dart';
import 'package:flutter_project/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  static const String routeName = "settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void confirmLogout() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade300,
            content: Container(
              height: 70,
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do you really want to logout?',
                    style: GoogleFonts.bebasNeue(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: logout,
                        color: Color.fromRGBO(0, 168, 181, 1),
                        child: Text('YES'),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      MaterialButton(
                        onPressed: () => Navigator.of(context).pop(),
                        color: Color.fromRGBO(238, 15, 15, 1),
                        child: Text('NO'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(173, 171, 171, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(53, 53, 53, 1),
          automaticallyImplyLeading: false,
          title: Image(image: AssetImage('assets/appbar.png')),
          centerTitle: true,
          leading:
              IconButton(onPressed: dashboard, icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/logo.png')),
            MaterialButton(
              height: 65,
              onPressed: confirmLogout,
              color: Color.fromRGBO(0, 168, 181, 1),
              child: Text('LOGOUT'),
            ),
          ],
        )),
      ),
    );
  }

  void dashboard() {
    Navigator.pushNamed(context, Dashboard.routeName);
  }

  void logout() {
    Navigator.pushNamed(context, LoginPage.routeName);
  }
}
