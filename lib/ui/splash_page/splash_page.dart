import 'package:blog_app_fullstackdev/helpers/shared_pref.dart';
import 'package:blog_app_fullstackdev/ui/home_page/home_page.dart';
import 'package:blog_app_fullstackdev/ui/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:blog_app_fullstackdev/utils/ext.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      await SharedPref.getData(key: SharedPref.token).then((token) {
        if (token.toString() != "null" && token.toString() != null) {
          context.next(HomePage());
        } else
          context.next(LoginPage());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
