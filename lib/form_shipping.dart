import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:terang_express/apis/api_tariff.dart';
import 'package:terang_express/globals/order_data.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/helpers/district_search.dart';
import 'package:terang_express/item_order.dart';
import 'package:terang_express/models/district.dart';
import 'package:terang_express/models/order_item.dart';

import 'mapsview.dart';

class FormShipping extends StatefulWidget {
  @override
  _FormShippingState createState() => _FormShippingState();
}

class _FormShippingState extends State<FormShipping> {

  Address dropAddress;
  District _district;

  final ContactPicker _contactPicker = new ContactPicker();

  var receiverController = TextEditingController();
  var phoneController = TextEditingController();
  var districtController = TextEditingController();
  var addressController = TextEditingController();

  int selectRadioBtn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRadioBtn = 1;
  }

  setSelectedRadio(int val){
    setState(() {
      selectRadioBtn = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo_small.png',
                width: 35.0, fit: BoxFit.fitWidth),
            SizedBox(
              width: 8.0,
            ),
            Text('Shipping')
          ],
        ),
        centerTitle: true,
      ),body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                if(await Permission.location.isGranted) {
                  dropAddress = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        MapsView(dropAddress)),
                  );
                  setState(() {
                    addressController.text = dropAddress.addressLine;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                color: Color(0xFFa20000),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16.0,
                    ),
                    Text('Pilih Lokasi Penerima',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      ),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    SizedBox(
                      width: 16.0,
                    )
                  ],
                ),
              ),
//            ),SizedBox(
//              height: 16.0,
//            ),
//            Theme(
//              data: new ThemeData(
//                  primaryColor: Color(0xFFa20000),
//                  accentColor: Color(0xFFa20000),
//                  hintColor: Color(0xFFa20000)),
//              child: new TextField(
//                decoration: new InputDecoration(
//                    focusedBorder: OutlineInputBorder(
//                      borderSide:
//                      BorderSide(color: Color(0xFFa20000), width: 2),
//                    ),
//                    enabledBorder: OutlineInputBorder(
//                      borderSide:
//                      BorderSide(color: Color(0xFFa20000), width: 2),
//                    ),
//                    border: new OutlineInputBorder(
//                        borderSide: new BorderSide(color: Color(0xFFa20000))),
//                    labelText: 'Lokasi Penerima',
//                    fillColor: Color(0xFFa20000),
//                    prefixIcon: const Icon(
//                      Icons.my_location,
//                      color: Color(0xFFa20000),
//                    ),
//                    suffixStyle: const TextStyle(color: Colors.white)),
//                style: TextStyle(color: Color(0xFFa20000)),
//              ),
            ),SizedBox(
              height: 16.0,
            ),Theme(
              data: new ThemeData(
                  primaryColor: Color(0xFFa20000),
                  accentColor: Color(0xFFa20000),
                  hintColor: Color(0xFFa20000)),
              child: new TextField(
                controller: addressController,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xFFa20000))),
                    labelText: 'Keterangan Alamat',
                    fillColor: Color(0xFFa20000),
                    prefixIcon: const Icon(
                      Icons.my_location,
                      color: Color(0xFFa20000),
                    ),
                    suffixStyle: const TextStyle(color: Colors.white)),
                style: TextStyle(color: Color(0xFFa20000)),
              ),
            ),SizedBox(
              height: 16.0,
            ),Theme(
              data: new ThemeData(
                  primaryColor: Color(0xFFa20000),
                  accentColor: Color(0xFFa20000),
                  hintColor: Color(0xFFa20000)),
              child: new TextField(
                controller: districtController,
                onTap: () async {
                  // generate a new token here
                  final District district = await showSearch(
                    context: context,
                    delegate: DistrictSearch(),
                  );
                  // This will change the text displayed in the TextField
                  if (district != null) {
                    _district = district;
                    districtController.text = district.name;
                  }
                },
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xFFa20000))),
                    labelText: 'Kota/Kabupaten',
                    fillColor: Color(0xFFa20000),
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Color(0xFFa20000),
                    ),
                    suffixStyle: const TextStyle(color: Colors.white)),
                style: TextStyle(color: Color(0xFFa20000)),
              ),
            ),SizedBox(
              height: 16.0,
            ),Theme(
              data: new ThemeData(
                  primaryColor: Color(0xFFa20000),
                  accentColor: Color(0xFFa20000),
                  hintColor: Color(0xFFa20000)),
              child: new TextField(
                controller: receiverController,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xFFa20000))),
                    labelText: 'Nama Penerima',
                    fillColor: Color(0xFFa20000),
                    prefixIcon: const Icon(
                      Icons.near_me,
                      color: Color(0xFFa20000),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if(await Permission.contacts.isGranted) {
                          Contact contact = await _contactPicker
                              .selectContact();
                          setState(() {
                            receiverController.text = contact.fullName;
                            phoneController.text = contact.phoneNumber.number;
                          });
                        }
                      },
                      icon: Icon(Icons.contact_phone,
                        color: Color(0xFFa20000),),
                    ),
                    suffixStyle: const TextStyle(color: Colors.white)),
                style: TextStyle(color: Color(0xFFa20000)),
              ),
            ),SizedBox(
              height: 16.0,
            ),Theme(
              data: new ThemeData(
                  primaryColor: Color(0xFFa20000),
                  accentColor: Color(0xFFa20000),
                  hintColor: Color(0xFFa20000)),
              child: new TextField(
                controller: phoneController,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFa20000), width: 2),
                    ),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Color(0xFFa20000))),
                    labelText: 'No. Hp Penerima',
                    fillColor: Color(0xFFa20000),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Color(0xFFa20000),
                    ),),
                style: TextStyle(color: Color(0xFFa20000)),
              ),
            ),SizedBox(
              height: 16.0,
            ),Text(
              'Ukuran Barang',
              style: TextStyle(
                color: Color(0xFFa20000)
              ),
            ),RadioListTile(
              value: 1,
              groupValue: selectRadioBtn,
              activeColor: Color(0xFFa20000),
              title: Text('small (maks 5kg, ukuran maks 20x11x7 cm)'),
              onChanged: (val){
                setSelectedRadio(val);
              },
            ),RadioListTile(
              value: 2,
              groupValue: selectRadioBtn,
              activeColor: Color(0xFFa20000),
              title: Text('medium (maks 5kg, ukuran maks 30x20x12 cm)'),
              onChanged: (val){
                setSelectedRadio(val);
              },
            ),RadioListTile(
              value: 3,
              groupValue: selectRadioBtn,
              activeColor: Color(0xFFa20000),
              title: Text('large (maks 5kg, ukuran maks 35x30x20 cm)'),
              onChanged: (val){
                setSelectedRadio(val);
              },
            ),SizedBox(
              height: 16.0,
            ),ButtonTheme(
              minWidth: double.infinity,
              child: FlatButton(
                color: Color(0xFFa20000),
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                onPressed: () async {
                  if(await assignValue())
                  nextPage(context, ItemOrder());
                },
                child: Text(
                  'Selesai',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }

  Future<bool> assignValue() async {
    if(dropAddress == null || _district == null ) {
      alertDialogOK(context, "Error", "Data Belum Lengkap");
      return false;
    }
    if(orderItemData == null){
      orderItemData = new OrderItem(
          dropAddress.coordinates.longitude,
          dropAddress.coordinates.longitude,
          addressController.text,
          receiverController.text,
          phoneController.text,
          selectRadioBtn,
          0,
          _district.districtId,
          0,
          0,
          _district.areaId
      );
    } else {
      orderItemData.dropLatitude = dropAddress.coordinates.longitude;
      orderItemData.dropLongitude = dropAddress.coordinates.longitude;
      orderItemData.dropAddress = addressController.text;
      orderItemData.receiverName = receiverController.text;
      orderItemData.receiverPhone = phoneController.text;
      orderItemData.goodSizeId = selectRadioBtn;
      orderItemData.receiverDistrictId = _district.districtId;
      orderItemData.receiverAreaId = _district.areaId;
    }
    ApiTariff apiTariff = await futureApiTariff(currentUser.token, orderData.pickupAreaId, orderItemData.receiverAreaId);
    if(apiTariff.isSuccess()){
      orderItemData.receiverEstimationValue = apiTariff.getTariff(orderItemData.goodSizeId);
      orderData.estimationValue = orderItemData.receiverEstimationValue;
      orderData.orderItems = new List();
      orderData.orderItems.add(orderItemData);
      return true;
    }
    return false;
  }
}
