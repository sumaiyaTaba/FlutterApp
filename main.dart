import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vilflutterapp/ShpInvntGrdView.dart';
import 'package:vilflutterapp/avilableProducts.dart';
import 'package:vilflutterapp/details_screen.dart';
import 'package:vilflutterapp/loginscreen.dart';
import 'package:provider/provider.dart';
import 'package:vilflutterapp/popular_product.dart';
import 'package:vilflutterapp/routes.dart';
import 'package:vilflutterapp/searchBar.dart';
import 'package:vilflutterapp/shopinvnt.dart';
import 'package:vilflutterapp/size_config.dart';
import 'package:vilflutterapp/splash_screen.dart';
import 'package:vilflutterapp/statusback.dart';
import 'package:vilflutterapp/theme.dart';
import 'authentication.dart';




//void main() => runApp(MaterialApp(home: MyApp(),));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (context) => MyHomePage(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ShopInvent.routeName: (context) => ShopInvent(),
        ShopInventgridView.routeName: (context) => ShopInventgridView(),
        SearchBar.routeName: (context) => SearchBar(),
        PopularProducts.routeName: (context) => PopularProducts(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        availableProducts.routeName: (context) => availableProducts(),

      },
      initialRoute: MyHomePage.routeName,
      //home: MyHomePage(),
    );
  }


}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/";
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the root of your application.
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _HomePageState extends State<MyHomePage> {


  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);


  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);


   // return MultiProvider(

    //  providers: [
   //     ChangeNotifierProvider.value(value: Authentication(),
    //    )
 //     ],

      return MaterialApp(
        home: Scaffold(

        backgroundColor: primaryColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //We take the image from the assets
              Image.asset(
                'assets/splash-image.png',
                height: 200,
              ),
              SizedBox(
                height: 30,
              ),
              //Texts and Styling of them
              Text(
                'Welcome to VIL',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 20),
              Text(
                'A one-stop portal for you to know the latest technologies from Vertical Innovations Ltd.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              //Our MaterialButton which when pressed will take us to a new screen named as
              //LoginScreen
              MaterialButton(
                elevation: 0,
                height: 50,
                onPressed: () {
                  Navigator.pushNamed((context), LoginScreen.routeName);

                 /*Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LoginScreen()));*/

                },
                color: logoGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                textColor: Colors.white,

              )
            ],

          ),


        ),

      ),
          /*debugShowCheckedModeBanner: false,
           theme: theme(),
          initialRoute: SplashScreen.routeName,
           // initialRoute: "/",
           routes: routes,*/
      );
  //  );
  }

  _signInWithGoogle() async {

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final FirebaseUser user = (await firebaseAuth.signInWithCredential(credential)).user;


  }

}
