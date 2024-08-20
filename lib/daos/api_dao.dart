import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/api.dart';

//會讀寫更新本地todos.json

class ApiDao {
  //找出檔案路徑
  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //找出api.json檔案
  Future<File> _getLocalFile() async {
    final path = await _getLocalPath();
    return File('$path/api-0813.json');
  }

  //讀取api.json檔案
  Future<List<API>> readAPIs() async {
    try {
      final file = await _getLocalFile();
      final contents = await file.readAsString();
      List<dynamic> jsonData = jsonDecode(contents);
      print(jsonData.map((json) => API.fromJson(json)).toList());
      return jsonData.map((json) => API.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<API>> readAPIs2(String contents) async {
    try {
      List<dynamic> jsonData = jsonDecode(contents);
      print(jsonData.map((json) => API.fromJson(json)).toList());
      return jsonData.map((json) => API.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  //寫入api.json檔案
  Future<File> writeAPIs(List<API> apis) async {
    final file = await _getLocalFile();
    return file.writeAsString(jsonEncode(apis.map((api) => api.toJson()).toList()));
  }
}