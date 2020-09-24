class CompanyType{
  int id;
  String name;
  String description;

  CompanyType(
      this.id,
      this.name,
      this.description,
      );

  CompanyType.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"],
        description = json["description"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}