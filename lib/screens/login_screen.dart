import 'package:flutter/material.dart';

//登入頁面

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cxcxc sheetDB App'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "歡迎來到 cxcxc sheetDB app",
              style: TextStyle(fontSize: 28),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/API_Info");
              },
              child: Text("登入")
            )
          ],
        ),
      )
      
    );
  }
}