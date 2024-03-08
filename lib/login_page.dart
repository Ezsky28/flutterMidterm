import 'package:flutter/material.dart';
import 'package:flutter_project/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Logo
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Image(image: AssetImage('assets/logo.png')),
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //Slogan
                    Text('Are you ready to know the world?',
                        style: GoogleFonts.bebasNeue(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 30)),

                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'Come with us and explore the world!',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 19),
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //email field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Container(
                                child: Icon(Icons.email),
                              ),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.focused)
                                          ? Color.fromRGBO(0, 168, 181, 1)
                                          : Color.fromRGBO(0, 0, 0, 1)),
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //password field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isPasswordVisible,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Container(
                                child: Icon(Icons.lock),
                              ),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.focused)
                                          ? Color.fromRGBO(0, 168, 181, 1)
                                          : Color.fromRGBO(0, 0, 0, 1)),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  icon: isPasswordVisible
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                              suffixIconColor: isPasswordVisible
                                  ? Color.fromRGBO(0, 0, 0, 1)
                                  : Color.fromRGBO(0, 168, 181, 1),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    //login button
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: login,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.white),
                              )
                            ]),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            backgroundColor: Color.fromRGBO(0, 168, 181, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' Register now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void setVisibility() {
    setState(() {});
  }

  void login() {
    Navigator.pushNamed(context, Dashboard.routeName);
  }
}
