import 'dart:convert';

class OrderItem{
  double dropLatitude;
  double dropLongitude;
  String dropAddress;
  String receiverName;
  String receiverPhone;
  int goodSizeId;
  int receiverStateId;
  int receiverDistrictId;
  int receiverSuDistrictId;
  double receiverEstimationValue;
  int receiverAreaId;

  OrderItem(
      this.dropLatitude,
      this.dropLongitude,
      this.dropAddress,
      this.receiverName,
      this.receiverPhone,
      this.goodSizeId,
      this.receiverStateId,
      this.receiverDistrictId,
      this.receiverSuDistrictId,
      this.receiverEstimationValue,
      this.receiverAreaId,
      );

  OrderItem.emptyOrder() :
        dropLatitude = 0.0,
        dropLongitude = 0.0,
        dropAddress = "",
        receiverName = "",
        receiverPhone = "",
        goodSizeId = 0,
        receiverStateId = 0,
        receiverDistrictId = 0,
        receiverSuDistrictId = 0,
        receiverEstimationValue = 0.0,
        receiverAreaId = 0;

  Map<String, dynamic> toJson() => {
    "latitude": dropLatitude,
    "longitude": dropLongitude,
    "destination_address": dropAddress,
    "destination_state_id": receiverStateId,
    "destination_district_id": receiverDistrictId,
    "destination_sub_district_id": receiverSuDistrictId,
    "receiver": receiverName,
    "receiver_phone": receiverPhone,
    "good_size_id": goodSizeId,
    "estimation_value": receiverEstimationValue,
    "destination_area_id": receiverAreaId,
  };

  String toStringJson() => json.encode(toJson());
}