class UserToken {
  int http_status;
  String message;
  String access_token;

  UserToken({
    required this.http_status,
    required this.message,
    required this.access_token
  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      http_status: json['http_status'],
      message: json['message'],
      access_token: json['access_token']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'http_status': http_status,
      'message': message,
      'access_token': access_token
    };
  }
}