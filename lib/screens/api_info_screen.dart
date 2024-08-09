import 'package:flutter/material.dart';
import 'package:flutter_application_1/daos/api_dao.dart';
import '../models/api.dart';
import '../daos/api_dao.dart';
import '../components/api_info_component.dart';

class ApiInfoScreen extends StatefulWidget {
  @override
  _ApiInfoScreenState createState() => _ApiInfoScreenState();
}

class _ApiInfoScreenState extends State<ApiInfoScreen> {
  final ApiDao _apiDao = ApiDao();
  
  List<API> _apis = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final apis = await _apiDao.readAPIs();
    setState(() {
      _apis = apis;
    });
  }

  @override
  Widget build(BuildContext context) {
    //_loadData();

    return Scaffold(
      appBar: AppBar(
        title: Text("我的APIs")
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: 1000,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 200,
                  child: Text("API名稱"),
                ),
                Container(
                  width: 700,
                  child: Text("API網址"),
                ),
                Container(
                  width: 100,
                  child: Text("API訪問次數"),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _apis.length,
                itemBuilder: (context, index) {
                  final api = _apis[index];
                  return ApiInfoComponent(api);
                },
              ),
            )
          ],
        )
      )
    );
  }
}