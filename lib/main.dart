import 'package:blog_app_fullstackdev/bloc/login/login_bloc.dart';
import 'package:blog_app_fullstackdev/bloc/register/register_bloc.dart';
import 'package:blog_app_fullstackdev/module.dart';
import 'package:blog_app_fullstackdev/ui/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  locator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(loginRepository: getIt.call())),
        BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(registerRepository: getIt.call())),
      ],
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
    // return BlocProvider<LoginBloc>(
    //   create: (context) => LoginBloc(loginRepository: getIt.call()),
    //   child: MaterialApp(
    //     home: SplashPage(),
    //   ),
    // );
  }
}
