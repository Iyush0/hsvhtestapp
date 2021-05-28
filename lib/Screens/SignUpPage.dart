import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              Text("Create New Account",style:GoogleFonts.khula(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24
              )),
              SizedBox(
                height: screenSize.height*0.004,
              ),
              Text("Please Fill the Form to Continue",style: GoogleFonts.khula(color: Color(0xffffffff),fontSize: 14),),
              SizedBox(
                height: screenSize.height*0.014,
              ),
              Form(
                child: Column(
                  children: [
                    InfoButton(title: 'Full Name',controller: nameController,currIcon: Icons.person,),
                    SizedBox(
                      height: screenSize.height*0.009,
                    ),
                    InfoButton(title: 'Email Address',controller: emailController,currIcon: Icons.mail,),
                    SizedBox(
                      height: screenSize.height*0.009,
                    ),
                    InfoButton(title: 'Phone Number',controller: phoneNoController,currIcon: Icons.phone_enabled,),
                    SizedBox(
                      height: screenSize.height*0.009,
                    ),
                    InfoButton(title: 'Password',controller: passwordController,currIcon: Icons.remove_red_eye,),
                    SizedBox(
                      height: screenSize.height*0.059,
                    ),
                    SignUpButton(text: "Sign Up",routeName: '/HomePage',),
                    SizedBox(
                      height: screenSize.height*0.010,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Have an Account?",style:GoogleFonts.khula(color: Colors.white,fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(text: ' Sign in', style: TextStyle(color: Color(0xffe23c08), fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap=(){
                               Navigator.pushNamed(context, '/LoginPage');
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

class SignUpButton extends StatelessWidget {
final String text,routeName;
Function onPressed;
   SignUpButton({
    this.text,
     this.routeName,
     this.onPressed,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
      width: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffc51b09),
              Color(0xffe23c08)
            ]
          ),
          borderRadius: BorderRadius.all(Radius.circular(18))
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(child: Text(text)),
      ),
    ));
  }
}



class InfoButton extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final  IconData currIcon;
   InfoButton({
    this.controller,
    this.title,
    this.currIcon,
    Key key,
  }) : super(key: key);

  @override
  _InfoButtonState createState() => _InfoButtonState();
}

class _InfoButtonState extends State<InfoButton> {
   bool hide=false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff596683),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.03),
        child: TextFormField(
          validator: (value){
            if(widget.controller.text.toString().isEmpty)
              {
                return 'Field cant be empty';
              }
            return null;
          },
          controller: widget.controller,
          obscureText: hide,
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              border: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            labelText: widget.title,
            labelStyle: GoogleFonts.khula(color: Colors.white,fontSize:screenSize.width*0.035 ),
            suffixIcon: widget.currIcon==Icons.remove_red_eye?IconButton(
               color: Color(0xff6786a4),
                icon: Icon(hide==false?widget.currIcon:Icons.strikethrough_s), onPressed: (){
                 setState(() {
                   hide=!hide;
                 });
            }):Icon(widget.currIcon,color: Color(0xff6786a4),)
          ),
        ),
      ),
    );
  }
}
/*Icon(currIcon,color: Color(0xff6786a4),)*/

