import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/company_type.dart';

Future<ApiCompanyType> futureApiCompanyTypes() async{
  var dio = Dio();
  String url = apiUrl + "company_types/";
  Response response = await dio.get(url);
  print(response.data);

  return ApiCompanyType.fromStringJson(response.toString());
}

class ApiCompanyType {
  String status;
  String message;
  List<CompanyType> companyTypes;

  ApiCompanyType({
    this.status,
    this.message,
    this.companyTypes,
  });

  ApiCompanyType.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        companyTypes = List<CompanyType>.from(json["data"].map((x) => CompanyType.fromJson(x)));

  ApiCompanyType.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data" : List<dynamic>.from(districts.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success" || status == "Success";
}