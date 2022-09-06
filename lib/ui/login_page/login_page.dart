import 'dart:math';

import 'package:blog_app_fullstackdev/bloc/login/login_bloc.dart';
import 'package:blog_app_fullstackdev/helpers/shared_pref.dart';
import 'package:blog_app_fullstackdev/ui/home_page/home_page.dart';
import 'package:blog_app_fullstackdev/ui/register_page/register_page.dart';
import 'package:blog_app_fullstackdev/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app_fullstackdev/utils/ext.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    emailTec.dispose();
    passwordTec.dispose();
    loginBloc.close();
    super.dispose();
  }

  var emailTec = TextEditingController(text: "mtk@gmail.com");
  var passwordTec = TextEditingController(text: "password");

  var _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
            ),
            FlutterLogo(
              size: 100,
            ),
            SizedBox(
              height: 80,
            ),
            Card(
              child: TextField(
                controller: emailTec,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
            ),
            Card(
              child: TextField(
                controller: passwordTec,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  if (emailTec.text.isEmpty || passwordTec.text.isEmpty) {
                    AppUtils.showSnackBar(
                      "Fill Data",
                      ScaffoldMessenger.of(context),
                    );
                  }

                  loginBloc.add(FetchLoginEvent(
                      email: emailTec.text, password: passwordTec.text));
                },
                child: Text("Login"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ));
                },
                child: Text("Register"),
              ),
            ),
            BlocListener(
              listener: (context, state) {
                if (state is LoginLoadedState) {
                  print(state.user.token);
                  SharedPref.setData(
                      key: SharedPref.token, value: state.user.token);
                  context.next(HomePage());
                }
                if (state is LoginErrorState) {
                  print(state.error.toString());
                  AppUtils.showSnackBar(
                    "Something went wrong.",
                    ScaffoldMessenger.of(context),
                  );
                }
              },
              bloc: loginBloc,
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Center();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
