import 'package:delta/main.dart';
import 'package:delta/qr/QrScreen.dart';
import 'package:flutter/material.dart';
import 'googleLogin.dart';
import 'package:hexcolor/hexcolor.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Hexcolor('#00e5ff'),Hexcolor('#1200ff') ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 70,
                backgroundColor: Colors.transparent,
              ),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 170.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                elevation: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.dashboard,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    phone,
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Caveat',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                elevation: 5,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    email,
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Caveat',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QrScreen()),
                    );
                },
                 
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70.0,8,70,8),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'IndieFlower'),
                  ),
                ),
                
               shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: Colors.white, width: 1)),
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70.0,8,70,8),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.black, fontFamily: 'IndieFlower'),
                  ),
                ),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
