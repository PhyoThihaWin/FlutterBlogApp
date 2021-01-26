import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPostPage extends StatefulWidget {
  @override
  _UploadPostPageState createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  var selectedCategoryId;

  File _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 220,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                    onTap: pickImage,
                    splashColor: Colors.blue[100],
                    child: _file == null
                        ? Stack(
                            children: [
                              Ink(
                                decoration: new BoxDecoration(
                                  color: Colors.grey[400],
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.photo,
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
                          )
                        : Image.file(
                            _file,
                            fit: BoxFit.cover,
                          )),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Card(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter title",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Description",
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0)),
                maxLines: 4,
              ),
            ),
            SizedBox(height: 30,),
            Card(
              child: DropdownButtonFormField<int>(
                onChanged: (i) {},
                items: [DropdownMenuItem(child: Text("Laravel"), value: 1)],
                decoration: InputDecoration(
                    hintText: "Select Category",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text("Upload Post"),
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
