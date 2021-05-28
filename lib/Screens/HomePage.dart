import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003466),
      appBar: AppBar(
        title:Text("HSVH Test",style: GoogleFonts.titilliumWeb(color: Colors.white)),
        elevation: 0,
        backgroundColor: Color(0xff003466),
      ),
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          children: [
           ListTile(
             title: Text('Tickets'),
             onTap: (){
               Navigator.pop(context);
             },
           ),
            ListTile(
              title: Text('Events'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Go Back',style: GoogleFonts.titilliumWeb(color: Colors.red)),
              onTap: (){
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, '/DummyPage');
              },
            ),
          ],
        ),
      ),
      body: Container(
            child: Center(child: Text("This is a demo page",style: GoogleFonts.titilliumWeb(color: Colors.white),)),
      ),
    );
  }
}
