import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vilflutterapp/ShopInventoryManagement.dart';
import 'package:vilflutterapp/main.dart';
import 'package:vilflutterapp/shopinvnt.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginpage";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  void _submit()
  {

  }

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: <Widget>[

          Text(
            'Sign In to VIL',
            textAlign: TextAlign.center,

          ),

          SizedBox(
            height: 50,
          ),
          //buildTextField('Email',Icons.account_circle),

          //mail

          Container(
            key: _formkey,
            decoration: BoxDecoration(
                color: secondaryColor,
                border: Border.all(color: Colors.blue)
            ),

            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'email',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  // prefix: Icon(icon),
                  border: InputBorder.none),
              keyboardType: TextInputType.emailAddress,
              validator: (value)
                {
                  if(value.isEmpty || !value.contains('@'))
                    {
                      return 'invalid email';
                    }
                  return null;
                },
              onSaved: (value)
                {

                },

            ),
          ),
          SizedBox(height: 20),
          //buildTextField('Password',Icons.lock),

          Container(
          //  key: _formkey,
            decoration: BoxDecoration(
                color: secondaryColor,
                border: Border.all(color: Colors.blue)
            ) ,

            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'password',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  // prefix: Icon(icon),
                  border: InputBorder.none),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (value)
                {
                  if(value.isEmpty || value.length <=5)
                    {
                      return 'invalid password';
                    }
                  return null;
                },
              onSaved: (value)
              {

              },

            ),
          ),
          SizedBox(height: 30),
          MaterialButton(
            elevation: 0,
            minWidth: double.maxFinite,
            height: 50,
            onPressed: () {
              FirebaseUser firebaseUser;
              firebaseAuth.signInWithEmailAndPassword(email: 'sumaiya0069@gmail.com', password: 'sumaiya').then((authResult){
                setState(() {
                  firebaseUser = authResult.user;
                });
                print(firebaseUser.email);
              });

              _submit();
              Navigator.pushNamed((context), ShopInvent.routeName);
/*
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ShopInvent()));*/
              },
            color: logoGreen,
            child: Text('Login',
                style: TextStyle(color: Colors.white, fontSize: 16)),

            textColor: Colors.white,

          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don't have an account in VIL ?             ",
                style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat'

                ),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignupPage()));
                },
                child: Text('Sign Up',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none
                ),

                ),

              )
            ],
          ),
          SizedBox(height: 20),
          MaterialButton(
            elevation: 0,
            minWidth: double.maxFinite,
            height: 50,
            onPressed: () async{
              final GoogleSignInAccount googleUser = await googleSignIn.signIn();
              final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
              final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
              final FirebaseUser user = (await firebaseAuth.signInWithCredential(credential)).user;
            },
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.google),
                SizedBox(width: 10),
                Text('Sign-in using Google',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
            textColor: Colors.white,
          ),

          SizedBox(height: 140),
          _buildFooterLogo()

        ],),
      ),
    );
  }


  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/vil_header_logo.png',
          height: 40,
        ),

      ],
    );
  }




}
