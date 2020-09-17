class District{
  int id;
  String name;
  int districtId;
  int stateId;
  int areaId;

  District(
      this.id,
      this.name,
      this.districtId,
      this.stateId,
      );

  District.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"],
        districtId = json["district_id"],
        stateId = json["state_id"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "district_id": districtId,
    "state_id": stateId,
  };
}