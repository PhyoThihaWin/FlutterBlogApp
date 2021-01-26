import 'package:blog_app_fullstackdev/ui/profile_page/profile_page.dart';
import 'package:blog_app_fullstackdev/ui/upload_post_page/upload_post_page.dart';
import 'package:blog_app_fullstackdev/widget/post_widget.dart';
import 'package:flutter/material.dart';

class Categorypage extends StatefulWidget {
  @override
  _CategorypageState createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog App"),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProfilePage();
                },
              ),
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return UploadPostPage();
                    },
                  ),
                );
              }),
        ],
      ),
      body: ListView(
        children: [
          PostWidget(),
          PostWidget(),
          PostWidget(),
          PostWidget(),
          PostWidget(),
        ],
      ),
    );
  }

  Widget buttonWidget() {
    return Center(
      child: Card(
          child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Text("Laravel"))),
    );
  }
}
