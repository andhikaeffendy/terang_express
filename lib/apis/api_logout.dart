import 'dart:io';
import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/api_response.dart';

Future<ApiResponse> futureApiLogout(String token) async{
  var dio = Dio();
  String url = apiUrl + "users/sign_out";
  FormData formData = new FormData.fromMap({
    "auth_token": token,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiResponse.fromStringJson(response.toString());
}