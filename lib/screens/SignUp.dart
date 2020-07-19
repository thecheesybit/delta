import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SuLayout();
  }
}

class SuLayout extends StatefulWidget {
  @override
  _SuLayoutState createState() => _SuLayoutState();
}

class _SuLayoutState extends State<SuLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Hexcolor('#FDD819'), Hexcolor('#E80505')],
            ),
          ),
        ),
      ),
    );
  }
}
