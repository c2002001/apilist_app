import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/daos/api_dao.dart';
import '../models/api.dart';
import '../daos/api_dao.dart';
import '../models/api.dart';
import '../components/api_info_component.dart';
import 'package:http/http.dart' as http;
import '../models/user_token.dart';
import '../daos/user_token_dao.dart';

class ApiInfoScreen extends StatefulWidget {
  @override
  _ApiInfoScreenState createState() => _ApiInfoScreenState();
}

class _ApiInfoScreenState extends State<ApiInfoScreen> {
  /* final UserTokenDao _usertoken = UserTokenDao();
  final ApiDao _apiDao = ApiDao();


  
  UserToken _token = UserToken(http_status: 9999999, message: "init", access_token: "");
  List<API> _apis = []; */

  /* Future<void> _loadData() async {
    final userToken = await _usertoken.readTokens();
    setState(() {
      _token = userToken;
    });
  }

  Future<void> _loadData2() async {
    final apis = await getAPIs();
    setState(() {
      _apis = apis;
    });
  }

  Future<List<API>> getAPIs() async {
    String token = _token.access_token;

    Map<String, String> headers = {
      'Authorization': 'Bearer ya29.a0AcM612wvJhljqexrdFLd7UtKt7uc0PRgrAPWIE6hg1REH-vy5pHdsDqxssguumemxxLTA7-nqOLyS8pPpfZb1aiGeTSlGEy997ue5EpgrFYNBJjxRexk-GU1xCL5Rp_XytLcxvplWbttefGL5goU4JHuxOnXMupBr_0aCgYKAS8SARMSFQHGX2Mia1t0hPAMyO-YmFV7dRBBpQ0170'
    };

    Uri url = Uri.parse('https://effective-meme-q79gvgg6pr5jhgw6-8080.app.github.dev/user/apis');
    
    final response = await http.get(url, headers: headers);

    print(response.body);

    final api_first = _apiDao.readAPIs2(response.body);
    
    return api_first;
  }

  @override
  void initState() {
    super.initState();
    _loadData2();
  } */


  API api = API(name: name, api_url: api_url, usetime: usetime, portID: portID, spreadsheet_url: spreadsheet_url);
  
  @override
  Widget build(BuildContext context) {
    //_loadData2();

    Widget addApiButton = TextButton(
      onPressed:() {
        //待寫 要跳出小視窗
      },
      child: Text("新增API")
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("我的APIs"),
        actions: [
          addApiButton
        ],
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