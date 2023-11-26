import 'package:cashir_app/main.dart';
import 'package:cashir_app/views/common/app-button.dart';
import 'package:cashir_app/views/common/height-spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              ""
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeightSpacer(0.03),
                      AppButton(
                          'Sign Up',
                          onTap: (){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Dashboard()),
                                    (route) => false
                            );
                          }
                      ),
                      HeightSpacer(0.05)
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}