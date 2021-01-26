import 'package:blog_app_fullstackdev/widget/post_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [Switch(value: true, onChanged: (bool value) {})],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.network(
                        "https://i.pinimg.com/originals/6d/ea/46/6dea46a6b54ff8dfbdc56e5b22064379.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text("Mg Mg"),
                  Text("mgmg@gmail.com"),
                  SizedBox(height: 24),
                  RaisedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.logout), Text("Logout")],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Your Post",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
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
}
