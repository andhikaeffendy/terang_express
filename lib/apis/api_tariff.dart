import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:terang_express/globals/variable.dart';

Future<ApiTariff> futureApiTariff(String token, int originId, int destinationId) async{
  var dio = Dio();
  String url = apiUrl + "orders/get_tariff";
  FormData formData = new FormData.fromMap({
    "auth_token": token,
    "origin_id": originId.toString(),
    "destination_id": destinationId.toString(),
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiTariff.fromStringJson(response.toString());
}

class ApiTariff {
  String status;
  String message;
  List<double> tariffs;
  double tariff_1;
  double tariff_2;
  double tariff_3;

  ApiTariff({
    this.status,
    this.message,
    this.tariff_1,
    this.tariff_2,
    this.tariff_3,
  });

  ApiTariff.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        tariff_1 = json["tariff_1"],
        tariff_2 = json["tariff_2"],
        tariff_3 = json["tariff_3"];

  ApiTariff.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "tariff_1": tariff_1,
    "tariff_2": tariff_2,
    "tariff_3": tariff_3,
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success" || status == "Success";

  double getTariff(int size){
    switch(size){
      case 1 : return tariff_1;
      case 2 : return tariff_2;
      case 3 : return tariff_3;
    }
  }
}