import 'package:flutter/material.dart';
import 'package:flutter_project/dashboard.dart';
//import 'package:flutter_project/login_page.dart';
//import 'package:flutter_project/pages/settings.dart';
import 'package:flutter_project/pages/view_country.dart';

final Map<String, WidgetBuilder> routes = {
  //LoginPage.routeName: (BuildContext context) => LoginPage(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  // Settings.routeName: (BuildContext context) => Settings(),
  CountryInfo.routeName: (BuildContext context) => CountryInfo(
        name: '',
      ),
};
