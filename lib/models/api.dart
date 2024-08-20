class API {
  String api_key;
  String api_name;
  String spreadsheet_id;
  String api_description;
  String user_id;
  String status;
  DateTime create_at;
  String name;
  String api_url;
  int usetime;
  int portID;
  String spreadsheet_url;

  API({
    required this.name,
    required this.api_url,
    required this.usetime,
    required this.portID,
    required this.spreadsheet_url
  });

  factory API.fromJson(Map<String, dynamic> json) {
    return API(
      name: json['name'],
      api_url: json['api_url'],
      usetime: json['usetime'] != 0
          ? json['usetime']
          : 0,
      portID: json['portID'],
      spreadsheet_url: json['spreadsheet_url']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'api_url': api_url,
      'usetime': usetime,
      'portID': portID,
      'spreadsheet_url': spreadsheet_url
    };
  }
}