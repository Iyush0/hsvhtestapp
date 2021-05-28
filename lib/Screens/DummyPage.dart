import 'package:apploreproject1/variables%20and%20constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
class DummyPage extends StatefulWidget {
  const DummyPage({Key key}) : super(key: key);

  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  WebViewController _controller;
  var x,y;
  void readJS()async{
     x=   await _controller.evaluateJavascript("window.document.getElementById('loginPanelEmail-input').value='$loginEmail'");
     y= await _controller.evaluateJavascript("window.document.getElementById('loginPanelPassword-input').value='$loginPassword'");
    print('$x,$y');

  }
void check()async{
  await _controller.evaluateJavascript("window.document.getElementById('loginPanelEmail-input').value='$loginEmail'");
  await _controller.evaluateJavascript("window.document.getElementById('loginPanelPassword-input').value='$loginPassword'");
}
NavigationDecision _decideNavigation(NavigationRequest request){
      print(request.url);
       check();
   //   readJS();
    //  print(x);
    return  NavigationDecision.navigate;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    if(Platform.isAndroid){
      WebView.platform= SurfaceAndroidWebView();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'https://www.ticketmaster.de/user?f_showBarcodeNumberInTicketStub=true&f_orderDetailsV3=true'
        ),
      ),
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          children: [
            ListTile(
              title: Text('Tickets',style: GoogleFonts.titilliumWeb(),),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/HomePage');
              },
            ),
            ListTile(
              title: Text('Events',style: GoogleFonts.titilliumWeb()),
            ),
            ListTile(
              title: Text('Profile',style: GoogleFonts.titilliumWeb()),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out',style: GoogleFonts.titilliumWeb(color: Colors.red)),
              onTap: (){
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, '/LoginPage');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl:"https://www.ticketmaster.de/user?f_showBarcodeNumberInTicketStub=true&f_orderDetailsV3=true" ,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller){
            _controller=controller;
          },
          onPageFinished: (_){
            readJS();
          },
          navigationDelegate: _decideNavigation,
          gestureRecognizers: Set()
            ..add(
                Factory<TapGestureRecognizer>(
                    () => TapGestureRecognizer())),
        ),
      ),
    );
  }
}
//