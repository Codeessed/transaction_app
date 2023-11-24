import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }

}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(

          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                  ],
                ),
              )
          ),
        ],
      ),
    )
  }
}