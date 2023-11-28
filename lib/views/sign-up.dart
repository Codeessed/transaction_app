import 'package:cashir_app/main.dart';
import 'package:cashir_app/theme/sizes.dart';
import 'package:cashir_app/viewmodels/usesr-view-model.dart';
import 'package:cashir_app/views/common/app-button.dart';
import 'package:cashir_app/views/common/app-text-form.dart';
import 'package:cashir_app/views/common/height-spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_validator/the_validator.dart';

import 'dashboard.dart';

class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }

}

class _SignUpState extends State<SignUp> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPassFocusNode = FocusNode();

  String password = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    UserViewModel userViewModel = context.watch<UserViewModel>();

    return GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: ts3,
              fontWeight: FontWeight.bold
            ),
          ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Fill the following details to proceed."
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            HeightSpacer(0.03),
                            AppTextInput(
                              hint: 'Name',
                                controller: _nameController,
                                validate: FieldValidator.minLength(3),
                                focusNode: _nameFocusNode
                            ),
                            HeightSpacer(0.02),
                            AppTextInput(
                                hint: 'Email',
                                controller: _emailController,
                                validate: FieldValidator.email(),
                                focusNode: _emailFocusNode
                            ),
                            HeightSpacer(0.02),
                            AppTextInput(
                                hint: 'Password',
                                onChanged: (value){
                                  setState(() {
                                    password = value.toString();
                                  });
                                },
                                controller: _passwordController,
                                validate: FieldValidator.minLength(6),
                                focusNode: _passwordFocusNode,
                            ),
                            HeightSpacer(0.02),
                            AppTextInput(
                                hint: 'Confirm Password',
                                controller: _confirmPassController,
                                validate: FieldValidator.equalTo(password),
                                focusNode: _confirmPassFocusNode
                            ),
                            HeightSpacer(0.1),
                            AppButton(
                                'Sign Up',
                                onTap: (){
                                  if(formKey.currentState!.validate()){
                                    userViewModel.getDetailsFromServer();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => Dashboard()),
                                            (route) => false
                                    );
                                  }
                                }
                            ),
                            HeightSpacer(0.05)
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}