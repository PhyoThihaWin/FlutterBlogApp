import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File _file;

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
            ),
            Card(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
            ),
            Card(
              child: TextField(
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
                onPressed: () {},
                child: Text("Register"),
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
