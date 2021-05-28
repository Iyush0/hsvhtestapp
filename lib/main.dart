import 'package:apploreproject1/Screens/DummyPage.dart';
import 'package:apploreproject1/Screens/HomePage.dart';
import 'package:apploreproject1/Screens/SignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/LogInPage.dart';
import 'Screens/Splash.dart';
import 'Screens/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var screensize;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => SplashScreen(),
        '/SignUpPage': (context) => SignUpPage(),
        '/LoginPage': (context) => LoginPage(),
        '/HomePage': (context) => HomePage(),
        '/WebViewPage': (context) => DummyPage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: Future.delayed(Duration(seconds: 4)),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Splash();
            }
            else if(snapshot.connectionState==ConnectionState.done){
            /*  {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,anotheranimation){
                  return SplashScreen();
                },
                transitionDuration: Duration(milliseconds: 2000),
                  transitionsBuilder: (context,animation,anotheranimation,child){
                  animation= CurvedAnimation(parent: animation, curve: Curves.bounceIn);
                  return RotationTransition(
                    child: child,
                    turns: animation,
                  );
                  }
                ));*/
              return (SplashScreen());
              }
            return CircularProgressIndicator();
      }),
    );
  }
}
