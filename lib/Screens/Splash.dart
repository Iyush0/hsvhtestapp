import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SignUpPage.dart';
class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Splashscreen.png'),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
}
