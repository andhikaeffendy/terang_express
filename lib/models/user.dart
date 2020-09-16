import 'dart:convert';

class User{
  int id;
  String name;
  String username;
  String email;
  String token;
  String photoUrl;

  User(
      this.id,
      this.name,
      this.username,
      this.email,
      this.token,
      this.photoUrl,
      );

  User.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"],
        username = json["username"],
        email = json["email"],
        token = json["token"],
        photoUrl = json["photo_url"];

  User.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "token": token,
    "photo_url": photoUrl,
  };

  String toStringJson() => json.encode(toJson());
}