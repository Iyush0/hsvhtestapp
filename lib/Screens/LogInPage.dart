import 'package:apploreproject1/variables%20and%20constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignUpPage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff003466),
      body: Container(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: screenSize.height*0.1,horizontal: screenSize.width*0.12),
          child: Column(
            children: [
              Image.asset(
                'assets/app-icon.png',
                height: screenSize.height*0.200,
                width: screenSize.width*0.400,

              ),
              SizedBox(
                height: screenSize.height*0.038,
              ),
              Text("Welcome Back!",style:GoogleFonts.khula(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24
              )),
              SizedBox(
                height: screenSize.height*0.004,
              ),
              Text("Please sign in to your account",style: GoogleFonts.khula(color: Color(0xffffffff),fontSize: 14),),
              SizedBox(
                height: screenSize.height*0.014,
              ),
              Form(
                key:_formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height*0.009,
                    ),
                    InfoButton(title: 'Email Address',controller: emailController,currIcon: Icons.mail,),
                    SizedBox(
                      height: screenSize.height*0.009,
                    ),
                    SizedBox(
                      height: screenSize.height*0.009,
                    ),
                    InfoButton(title: 'Password',controller: passwordController,currIcon: Icons.remove_red_eye,),
                    Text("Forgot Password?",
                    style: TextStyle(color:Color(0xff596683) ),
                    textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: screenSize.height*0.059,
                    ),
                    SignUpButton(
                      text: "Log In",routeName: "/HomePage",
                      onPressed: (){
                        if(_formKey.currentState.validate()) {
                          loginEmail = emailController.text.toString();
                          loginPassword = passwordController.text.toString();
                          Navigator.pushNamed(context, '/WebViewPage');
                        }
                      }
                      ,),
                    SizedBox(
                      height: screenSize.height*0.029,
                    ),
               /* GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/WebViewPage');
                    },
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenSize.width*0.020,
                            ),
                            Image(
                              image: AssetImage('assets/google.png'),
                              fit: BoxFit.fitHeight,
                              height: 30,
                            ),
                            SizedBox(
                              width: screenSize.width*0.030,
                            ),
                            Text('Sign In with Google'),
                          ],
                        )),
                      ),
                    )),
                    SizedBox(
                      height: screenSize.height*0.010,
                    ),*/
                    RichText(
                      text: TextSpan(
                          text: "Don't Have an Account?",style:GoogleFonts.khula(color: Colors.white,fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(text: ' Sign Up', style: TextStyle(color: Color(0xffe23c08), fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap=(){
                                    Navigator.pushNamed(context, '/SignUpPage');
                                  }
                            )
                          ]
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
