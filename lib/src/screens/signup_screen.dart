import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/src/Widgets/bottom_nav.dart';
import 'package:food_delivery_app/src/Widgets/sign_or.dart';
import 'package:food_delivery_app/src/custom/button.dart';
import 'package:food_delivery_app/src/custom/circle_avatar.dart';
import 'package:food_delivery_app/src/custom/textfield.dart';

import 'home_page.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _numberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _isObscure = false;
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 250.0,
                height: 150.0,
                child: Image.asset("assets/images/menus/ic_food_express.png"),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: CustomTextFormField(
                                    controller: _numberController,
                                    hint: 'First Name',
                                    validate: validateFirstName,
                                  ),
                                ),
                                Flexible(
                                  child: CustomTextFormField(
                                    controller: _numberController,
                                    hint: 'Last Name',
                                    validate: validateLastName,
                                  ),
                                ),
                              ],
                            ),
                            CustomTextFormField(
                              controller: _numberController,
                              hint: 'Phone Number',
                              prefixIcon: Icon(
                                Icons.call,
                              ),
                              validate: validateNumber,
                            ),
                            CustomTextFormField(
                              isIcon: true,
                              hint: 'Invitation Code',
                              prefixIcon: Icon(
                                Icons.code,
                              ),
                              action: TextInputAction.next,
                            ),
                            SizedBox(
                              height: 30,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.info_outline,
                                          color: Color(0xFF666666), size: 20),
                                    ),
                                    TextSpan(
                                      text:
                                          " Leave empty if you don't have Invitation Code",
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomSignButton(
                                text: "SIGN IN",
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomNav()),
                                    );
                                  }
                                }),
                            OrWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomCircleAvatar(
                                  isIcon: FontAwesomeIcons.facebookF,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                CustomCircleAvatar(
                                    isIcon: FontAwesomeIcons.google),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Align(
                  // alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                      ),
                      FlatButton(
                        // Within the `FirstRoute` widget
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        textColor: Colors.blue,
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.pink),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


String validateNumber(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return 'Please enter Phone Number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid Phone Number';
  }
  return null;
}
String validateFirstName(String value) {
  if (value.isEmpty) {
    return 'Please Enter First Name';
  }
  return null;
}

String validateLastName(String value) {
  if (value.isEmpty) {
    return 'Please Enter Last Name';
  }
  return null;
}