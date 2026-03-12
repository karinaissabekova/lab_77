import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {

  final String name;
  final String email;
  final String phone;

  UserInfoPage({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Name: $name", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),

            Text("Email: $email", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),

            Text("Phone: $phone", style: TextStyle(fontSize: 20)),

          ],
        ),
      ),
    );
  }
}