import 'package:delta/phone/stores/login_store.dart';
import 'package:delta/qr/QrScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';



class PhoneHomePage extends StatefulWidget {
  const PhoneHomePage({Key key}) : super(key: key);
  @override
  _PhoneHomePageState createState() => _PhoneHomePageState();
}

class _PhoneHomePageState extends State<PhoneHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Scaffold(
    
          body: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Hexcolor('#FDD819'), Hexcolor('#E80505')],
          ),
          ),
        
            child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QrScreen()),
                    );
                      },
                      elevation: 5,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Continue',
                              style: TextStyle(color: Colors.black),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Colors.red,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: RaisedButton(
                        onPressed: () {
                          loginStore.signOut(context);
                        },
                        elevation: 5,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Sign Out',
                                style: TextStyle(color: Colors.black),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  color: Colors.red,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
