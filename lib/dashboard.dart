import 'package:flutter/material.dart';
import 'package:flutter_project/pages/dashboardData.dart';
import 'package:flutter_project/pages/notes.dart';
import 'package:flutter_project/pages/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_project/pages/settings.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  void _navbottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [DashData(), Notes(), Profile()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: _pages[_selectedIndex],
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(53, 53, 53, 1),
            automaticallyImplyLeading: false,
            title: Image(image: AssetImage('assets/appbar.png')),
            centerTitle: true,
            actions: [
              IconButton(onPressed: settings, icon: Icon(Icons.settings))
            ],
          ),
          bottomNavigationBar: Container(
            color: Color.fromRGBO(53, 53, 53, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              child: GNav(
                onTabChange: (index) => setState(() => _selectedIndex = index),
                selectedIndex: _selectedIndex,
                backgroundColor: Color.fromRGBO(53, 53, 53, 1),
                color: Colors.white,
                activeColor: Color.fromRGBO(0, 168, 181, 1),
                tabBackgroundColor: Color.fromRGBO(88, 88, 88, 1),
                iconSize: 20,
                gap: 20,
                padding: EdgeInsets.all(20),
                tabs: const [
                  GButton(
                    icon: Icons.dashboard,
                    text: 'Dashboard',
                  ),
                  GButton(
                    icon: Icons.sticky_note_2,
                    text: 'Notes',
                  ),
                  GButton(
                    icon: Icons.account_circle,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void settings() {
    Navigator.pushNamed(context, Settings.routeName);
  }
}
