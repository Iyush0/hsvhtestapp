import 'package:apploreproject1/Screens/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {

   SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Splashscreen.png'),
                fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding:  EdgeInsets.only(bottom:screensize.height*0.090),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('HSVH Test',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 35),),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screensize.width*0.21),
                    child: Text('Wheather we create history or not we are a part of history',style: GoogleFonts.titilliumWeb(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),textAlign:TextAlign.center,),
                  ),
                  SizedBox(
                    height: screensize.height*0.009,
                  ),
                  SignUpButton(text:"Get Started",routeName: "/LoginPage",

                  onPressed: (){
                    Navigator.pushNamed(context, '/LoginPage');
                  },
                  ),
                ],
              ),

          ),
        ),
      ),
    );
  }
}