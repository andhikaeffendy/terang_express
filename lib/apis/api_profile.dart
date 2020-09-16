import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/profile.dart';

Future<Profile> futureApiProfile(String token) async{
  var dio = Dio();
  String url = apiUrl + "users/profile_detail";
  Response response = await dio.get(url, queryParameters: {
    "auth_token" : token,
  });
  print(response.data);

  return Profile.fromStringJson(response.toString());
}