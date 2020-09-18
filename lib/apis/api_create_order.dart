import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/api_response.dart';

Future<ApiResponse> futureApiCreateOrder(String token, String order) async{
  var dio = Dio();
  String url = apiUrl + "orders/new_order";
  FormData formData = new FormData.fromMap({
    "auth_token": token,
    "order": order,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiResponse.fromStringJson(response.toString());
}