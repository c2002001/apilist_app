import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/user_token.dart';

class UserTokenDao {
  //找出檔案路徑
  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //找出api.json檔案
  Future<File> _getLocalFile() async {
    final path = await _getLocalPath();
    return File('$path/usertoken-0813.json');
  }

  Future<UserToken> readTokens() async {
    try {
      final file = await _getLocalFile();
      final contents = await file.readAsString();
      dynamic jsonData = jsonDecode(contents);
      return UserToken.fromJson(jsonData);
    } catch (e) {
      return UserToken(http_status: 99999, message: "failed to get Token", access_token: "");
    }
  }

  Future<File> writeTokens(UserToken usertoken) async {
    final file = await _getLocalFile();
    return file.writeAsString(jsonEncode(usertoken.toJson()));
  }
}