import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/order.dart';

Future<ApiOrder> futureApiGetOrders(String token) async{
  var dio = Dio();
  String url = apiUrl + "orders";
  Response response = await dio.get(url, queryParameters: {
    "auth_token" : token,
  });
  print(response.data);

  return ApiOrder.fromStringJson(response.toString());
}

class ApiOrder {
  String status;
  String message;
  List<Order> orders;

  ApiOrder({
    this.status,
    this.message,
    this.orders,
  });

  ApiOrder.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        orders = List<Order>.from(json["data"].map((x) => Order.fromJson(x)));

  ApiOrder.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data" : List<dynamic>.from(orders.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success" || status == "Success";
}