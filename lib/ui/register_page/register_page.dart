import 'dart:io';

import 'package:blog_app_fullstackdev/bloc/register/register_bloc.dart';
import 'package:blog_app_fullstackdev/helpers/shared_pref.dart';
import 'package:blog_app_fullstackdev/ui/home_page/home_page.dart';
import 'package:blog_app_fullstackdev/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:blog_app_fullstackdev/utils/ext.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  File _file;

  var nameTec = TextEditingController();
  var emailTec = TextEditingController();
  var passwordTec = TextEditingController();
  RegisterBloc registerBloc;

  @override
  void dispose() {
    nameTec.dispose();
    emailTec.dispose();
    passwordTec.dispose();
    registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 140,
              width: 140,
              child: _file == null
                  ? InkWell(
                      customBorder: CircleBorder(),
                      splashColor: Colors.blue[100],
                      onTap: pickImage,
                      child: Stack(
                        children: [
                          Center(
                            child: Ink(
                              width: 140,
                              decoration: new BoxDecoration(
                                color: Colors.grey[400],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Upload\nPhoto",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      customBorder: CircleBorder(),
                      splashColor: Colors.blue.withOpacity(0.3),
                      onTap: pickImage,
                      child: Ink(
                        width: 140,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(_file), // picked file
                                fit: BoxFit.cover)),
                      ),
                    ),
            ),
            SizedBox(
              height: 80,
            ),
            Card(
              child: TextField(
                controller: nameTec,
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
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
                  if (nameTec.text.isEmpty ||
                      emailTec.text.isEmpty ||
                      passwordTec.text.isEmpty) {
                    AppUtils.showSnackBar(
                      "Fill Data",
                      ScaffoldMessenger.of(context),
                    );
                  }

                  if (_file == null) {
                    AppUtils.showSnackBar(
                      "Select Image",
                      ScaffoldMessenger.of(context),
                    );
                  }

                  registerBloc.add(FetchRegisterEvent(
                      name: nameTec.text,
                      email: emailTec.text,
                      password: passwordTec.text,
                      image: MultipartFile.fromFile(_file.path,
                          filename: basename(_file.path))));
                },
                child: Text("Register"),
              ),
            ),
            BlocListener(
              listener: (context, state) {
                if (state is RegisterLoadedState) {
                  print(state.user.token);
                  SharedPref.setData(
                      key: SharedPref.token, value: state.user.token);
                  context.next(HomePage());
                }
                if (state is RegisterErrorState) {
                  print(state.error.toString());
                  AppUtils.showSnackBar(
                    "Something went wrong.",
                    ScaffoldMessenger.of(context),
                  );
                }
              },
              bloc: registerBloc,
              child: BlocBuilder<RegisterBloc, RegisterState>(
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

  final picker = ImagePicker();

  void pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
