import 'package:blog_app_fullstackdev/ui/category_page/category_page.dart';
import 'package:blog_app_fullstackdev/ui/profile_page/profile_page.dart';
import 'package:blog_app_fullstackdev/ui/upload_post_page/upload_post_page.dart';
import 'package:blog_app_fullstackdev/widget/post_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Container(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buttonWidget();
              },
              itemCount: 10,
            ),
          ),
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
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Categorypage(),
            ));
          },
          child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Text("Laravel")),
        ),
      ),
    );
  }
}
