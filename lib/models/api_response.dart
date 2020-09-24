import 'dart:convert';

class ApiResponse {
  String status;
  String message;

  ApiResponse({
    this.status,
    this.message,
  });

  ApiResponse.fromJson(Map<String, dynamic> json) :
        status = json["status"] ?? "",
        message = json["message"] ?? "";

  ApiResponse.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success" || status == "Success" ;
}