import 'package:flutter/material.dart';
import '../models/api.dart';

class ApiInfoComponent extends StatefulWidget {
  API api;

  ApiInfoComponent(this.api);

  @override
  State createState() {
    return _ApiInfoComponentState();
  }
}

class _ApiInfoComponentState extends State<ApiInfoComponent> {
  @override
  Widget build(BuildContext context) {
    Widget listAPI = Row(
      children: [
        Container(
          width: 200,
          child: Text(this.widget.api.name),
        ),
        Container(
          width: 700,
          child: Row(
            children: [
              TextButton(
                child: Text(this.widget.api.api_url.toString()),
                onPressed: () {
                //待寫
                },
              ),
              IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  setState(() {
                    //待寫
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  setState(() {
                    //待寫
                  });
                },
              ),
            ],
          )
        ),
        Container(
          width: 100,
          child: Text(this.widget.api.usetime.toString()),
        )
      ],
    );

    return Container(
      width: 1000,
      child: listAPI,
    );
  }
}