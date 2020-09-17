import 'dart:convert';

import 'package:terang_express/models/order_item.dart';

class Order{
  String orderDate;
  String description;
  String note;
  int userAddressId;
  String pickupAddress;
  int pickupStateId;
  int pickupDistrictId;
  int pickupSubDistrictId;
  double pickupLatitude;
  double pickupLongitude;
  double estimationValue;
  int pickupAreaId;
  String senderName;
  String senderPhone;
  int saveAddress;
  String labelAddress;

  List<OrderItem> orderItems;

  Order(
      this.orderDate,
      this.description,
      this.note,
      this.userAddressId,
      this.pickupAddress,
      this.pickupStateId,
      this.pickupDistrictId,
      this.pickupSubDistrictId,
      this.pickupLatitude,
      this.pickupLongitude,
      this.estimationValue,
      this.pickupAreaId,
      this.senderName,
      this.senderPhone,
      this.saveAddress,
      this.labelAddress,
      );

  Order.emptyOrder() :
    orderDate = "",
    description = "",
    note = "",
    userAddressId = 0,
    pickupAddress = "",
    pickupStateId = 0,
    pickupDistrictId = 0,
    pickupSubDistrictId = 0,
    pickupLatitude = 0.0,
    pickupLongitude = 0.0,
    estimationValue = 0.0,
    pickupAreaId = 0,
    senderName = "",
    senderPhone = "",
    saveAddress = 0,
    labelAddress = "";

  Map<String, dynamic> toJson() => {
    "order_date": orderDate,
    "description": description,
    "note": note,
    "user_address_id": userAddressId,
    "pickup_address": pickupAddress,
    "pickup_state_id": pickupStateId,
    "pickup_district_id": pickupDistrictId,
    "pickup_sub_district_id": pickupSubDistrictId,
    "latitude": pickupLatitude,
    "longitude": pickupLongitude,
    "estimation_value": estimationValue,
    "pickup_area_id": pickupAreaId,
    "sender_name": senderName,
    "sender_phone": senderPhone,
    "save_address": saveAddress,
    "label_address": labelAddress,
    "order_items_attributes": List<dynamic>.from(orderItems.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(toJson());
}