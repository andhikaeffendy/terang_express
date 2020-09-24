import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/api_response.dart';

Future<ApiResponse> futureApiChangePassword(String token, String old_password, String new_password, String new_password_confirmation) async{
  var dio = Dio();
  String url = apiUrl + "users/change_password";
  FormData formData = new FormData.fromMap({
    "auth_token": token,
    "old_password": old_password,
    "new_password": new_password,
    "new_password_confirmation": new_password_confirmation,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiResponse.fromStringJson(response.toString());
}