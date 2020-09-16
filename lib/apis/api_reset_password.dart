import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/api_response.dart';

Future<ApiResponse> futureApiResetPassword(String email) async{
  var dio = Dio();
  String url = apiUrl + "users/forgot_password";
  FormData formData = new FormData.fromMap({
    "email": email,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiResponse.fromStringJson(response.toString());
}