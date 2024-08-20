import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_token.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../models/user_token.dart';
import '../daos/user_token_dao.dart';

//登入頁面

class LoginScreen extends StatelessWidget {
  final UserTokenDao _usertoken = UserTokenDao();

  UserToken userToken = UserToken(http_status: 9999999, message: "init", access_token: "");

  final Uri _url = Uri.parse('https://effective-meme-q79gvgg6pr5jhgw6-8080.app.github.dev/app/auth');

  Future<void> _launchUrl() async {
    if(!await canLaunchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
    else {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
      //_getToken();
    }
  }

  Future<void> _getToken() async {
    /* var client = http.Client();
    print(http.Client());
    try {
      var response = await client.get(
          Uri.https('https://effective-meme-q79gvgg6pr5jhgw6-8080.app.github.dev', 
          '/app/auth'));
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
      ptint('client.close()');
    } */
    print("_getToken");

    var _url = Uri.https('effective-meme-q79gvgg6pr5jhgw6-8080.app.github.dev', '/app/auth');
    print("_url: $_url");

    var response = await http.get(_url);
    print("response.body： " + response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(jsonData);
      /* userToken = UserToken.fromJson(jsonData);
      _usertoken.writeTokens(userToken);
      print("寫入 access_token 成功，userToken = " + userToken.access_token); */
    } else {
    print('Failed to retrieve data');
    }
  }

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
                _launchUrl();
              },
              child: Text("登入")
            ),
            TextButton(
              onPressed: () {
                _getToken();
                if(userToken.http_status == 200) {
                  //print(response.statusCode + "： 跳轉 API_Info");
                  Navigator.pushNamed(context, "/API_Info");
                }
              },
              child: Text("取得Token"))
          ],
        ),
      )
      
    );
  }
}