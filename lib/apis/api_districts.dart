import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/district.dart';

Future<ApiDistrict> futureApiDistricts(String token) async{
  var dio = Dio();
  String url = apiUrl + "districts/";
  Response response = await dio.get(url, queryParameters: {
    "auth_token" : token,
  });
  print(response.data);

  return ApiDistrict.fromStringJson(response.toString());
}

class ApiDistrict {
  String status;
  String message;
  List<District> districts;

  ApiDistrict({
    this.status,
    this.message,
    this.districts,
  });

  ApiDistrict.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        districts = List<District>.from(json["data"].map((x) => District.fromJson(x)));

  ApiDistrict.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data" : List<dynamic>.from(districts.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success" || status == "Success";
}