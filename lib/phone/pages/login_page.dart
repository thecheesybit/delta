import 'package:delta/main.dart';
import 'package:delta/phone/stores/login_store.dart';
import 'package:delta/phone/widgets/loader_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isLoginLoading,
            child: Scaffold(
              // appBar: AppBar(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0.0,
              // ),
              extendBodyBehindAppBar: true,
              key: loginStore.loginScaffoldKey,
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Hexcolor('#E80505'), Hexcolor('#FDD819')],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                             
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                          // child: Container(
                                          //   height: 240,
                                          //   constraints:
                                          //       const BoxConstraints(maxWidth: 500),
                                          //   margin: const EdgeInsets.only(top: 100),
                                          //   decoration: const BoxDecoration(
                                          //       color: Color(0xFFE1E0F5),
                                          //       borderRadius: BorderRadius.all(
                                          //           Radius.circular(30))),
                                          // ),
                                          ),
                                      SizedBox(),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 26.5),
                                          child: Container(
                                              constraints: const BoxConstraints(
                                                  maxHeight: 340),
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: Image.asset(
                                                  'assets/images/logo6.png')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text('Login With Phone',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontFamily: 'Lobster'))),
                                IconButton(
                                  icon: Container(
                                    //padding: const EdgeInsets.only(top: 10),
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        
                          Expanded(
                             
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 100,
                                ),
                                Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: 'We will send you an ',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        TextSpan(
                                            text: 'One Time Password ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: 'on this mobile number',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ]),
                                    )),
                                Container(
                                  height: 47,
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: CupertinoTextField(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40))),
                                    controller: phoneController,
                                    clearButtonMode:
                                        OverlayVisibilityMode.editing,
                                    keyboardType: TextInputType.phone,
                                    maxLines: 1,
                                    placeholder: '+91...',
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (phoneController.text.isNotEmpty) {
                                        loginStore.getCodeWithPhoneNumber(
                                            context,
                                            phoneController.text.toString());
                                      } else {
                                        loginStore.loginScaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.red,
                                          elevation: 3,
                                          content: Text(
                                            'Please enter a phone number',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ));
                                      }
                                    },
                                    elevation: 5,
                                    color: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40))),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Next',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              color: Colors.redAccent,
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
