import 'dart:convert';

class Profile{
  String name;
  String username;
  String email;
  String hp;
  String gender;
  String companyName;
  String companyType;

  Profile(
      this.name,
      this.username,
      this.email,
      this.hp,
      this.gender,
      this.companyName,
      this.companyType,
      );

  Profile.fromJson(Map<String, dynamic> json) :
        name = json["name"],
        username = json["username"],
        email = json["email"],
        hp = json["hp"] ?? "-" ,
        gender = json["gender"] ?? "-",
        companyName = json["company_name"] ?? "-",
        companyType = json["company_type"] ?? "-";

  Profile.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
    "hp": hp,
    "gender": gender,
    "company_name": companyName,
    "company_type": companyType,
  };
}