import 'package:delta/screens/firstScreen.dart';
import 'package:delta/screens/googleLogin.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delta/screens/SignIn.dart';

final List<String> imgList = [
  'assets/images/vit.png'
  // 'assets/images/logo14.png',
  // 'assets/images/logo7.png',
  // 'assets/images/logo13.png',
  // 'assets/images/logo10.png',
  // 'assets/images/logo12.png',
  // 'assets/images/logo11.png',
];

int mode;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delta',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Hexcolor('#00E5FF'), Hexcolor('#1200FF')],
            ),
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 40.0),
                  child: CarouselSlider(
                    options: CarouselOptions(autoPlay: false),
                    items: imgList
                        .map(
                          (item) => Container(
                            child: Center(
                              child: Image.asset(item, width: 290),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Text(
                'VTOP TIME TABLE',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 150.0,
                height: 0.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),SizedBox(
                width: 150.0,
                height: 0.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),SizedBox(
                width: 150.0,
                height: 0.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    //side: BorderSide(color: Colors.white, width: 1)),
                  ),
                  elevation: 4,
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  onPressed: () {
                    mode = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                            image: AssetImage("assets/images/phone_logo.png"),
                            height: 35.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5.5,0,5.5,0),
                          child: Text(
                            "Sign In with Phone",
                            style: TextStyle(
                              fontFamily: 'IndieFlower',
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                splashColor: Colors.grey,
                onPressed: () {
                  mode = 1;
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FirstScreen();
                        },
                      ),
                    );
                  });
                },
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/images/google_logo.png"),
                          height: 35.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'IndieFlower',
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'Don\'t have account?',
              //       style: TextStyle(
              //         fontFamily: 'IndieFlower',
              //         fontSize: 20.0,
              //         color: Colors.white,
              //       ),
              //     ),
              //     FlatButton(
              //       textColor: Colors.black,
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => SignUpPage()));
              //       },
              //       child: Text(
              //         "Register Now",
              //         style: TextStyle(
              //           fontFamily: 'IndieFlower',
              //           fontSize: 20.0,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
