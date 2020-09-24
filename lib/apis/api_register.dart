import 'package:dio/dio.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/api_response.dart';

Future<ApiResponse> futureApiRegister(String username, String name, String email,
    String password, String passwordConfirmation, String hp, String gender,
    String companyName, int companyType) async{
  var dio = Dio();
  String url = apiUrl + "users";
  FormData formData = new FormData.fromMap({
    "username": username,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "name": name,
    "gender": gender,
    "hp": hp,
    "email": email,
    "company_name": companyName,
    "company_type_id": companyType,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return ApiResponse.fromStringJson(response.toString());
}