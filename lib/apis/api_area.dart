import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:terang_express/globals/variable.dart';

Future<ApiArea> futureApiArea(String token, int districtId) async{
  var dio = Dio();
  String url = apiUrl + "orders/get_area";
  FormData formData = new FormData.fromMap({
    "auth_token": token,
    "id": districtId.toString(),
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiArea.fromStringJson(response.toString());
}

class ApiArea {
  String status;
  String message;
  int areaId;
  String areaName;

  ApiArea({
    this.status,
    this.message,
    this.areaId,
    this.areaName,
  });

  ApiArea.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        areaId = json["id"],
        areaName = json["name"];

  ApiArea.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "id": areaId,
    "name": areaName,
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success" || status == "Success";
}