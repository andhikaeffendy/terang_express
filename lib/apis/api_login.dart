import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/user.dart';

Future<ApiLogin> futureApiLogin(String username, String password) async{
  var dio = Dio();
  String url = apiUrl + "users/sign_in";
  FormData formData = new FormData.fromMap({
    "username": username,
    "password": password,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiLogin.fromStringJson(response.toString());
}

class ApiLogin {
  String status;
  String message;
  User user;

  ApiLogin({
    this.status,
    this.message,
    this.user,
  });

  ApiLogin.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        user = User.fromJson(json);

  ApiLogin.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user.toJson(),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success" || status == "Success";
}