import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:terang_express/form_shipping.dart';
import 'package:terang_express/globals/order_data.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/helpers/district_search.dart';
import 'package:terang_express/introduction_screen.dart';
import 'package:terang_express/mapsview.dart';
import 'package:terang_express/models/district.dart';
import 'package:terang_express/models/order.dart';

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  DateTime now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String _date = "Input Tanggal Pickup";
  bool status1 = false;
  DateTime min = DateTime.now();
  DateTime max = DateTime.now().add(new Duration(days: 30));

  final ContactPicker _contactPicker = new ContactPicker();
  District _district;

  Address pickupAddress;

  var addressController = new TextEditingController();
  var senderController = new TextEditingController();
  var phoneController = new TextEditingController();
  var districtController = new TextEditingController();
  var labelController = new TextEditingController();
  var noteController = new TextEditingController();

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
            Text('Order')
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              RaisedButton(
                onPressed: () {
                  if(now.hour > 12)
                    min = min.add(new Duration(days: 1));
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: min,
                      maxTime: max, onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {

                    });
                  }, currentTime: min, locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Color(0xFFa20000),
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Color(0xFFa20000),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Ganti",
                        style: TextStyle(
                            color: Color(0xFFa20000),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 16.0,
              ),GestureDetector(
                onTap: () async {
                  if(await Permission.location.isGranted) {
                    pickupAddress = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          MapsView(pickupAddress)),
                    );
                    setState(() {
                      addressController.text = pickupAddress.addressLine;
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
                      Text('Temukan Saya',
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
              ),
              SizedBox(
                height: 16.0,
              ),
              Theme(
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
              ),
              SizedBox(
                height: 16.0,
              ),
              Theme(
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
                      districtController.text = _district.name;
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
              ),
              SizedBox(
                height: 16.0,
              ),
              Theme(
                data: new ThemeData(
                    primaryColor: Color(0xFFa20000),
                    accentColor: Color(0xFFa20000),
                    hintColor: Color(0xFFa20000)),
                child: new TextField(
                  controller: senderController,
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
                      labelText: 'Nama Pengirim',
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
                              senderController.text = contact.fullName;
                              phoneController.text = contact.phoneNumber.number;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.contact_phone,
                          color: Color(0xFFa20000),
                        ),
                      ),
                      suffixStyle: const TextStyle(color: Colors.white)),
                  style: TextStyle(color: Color(0xFFa20000)),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Theme(
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
                      labelText: 'Nomor Telepon Pengirim',
                      fillColor: Color(0xFFa20000),
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Color(0xFFa20000),
                      ),
                      suffixStyle: const TextStyle(color: Colors.white)),
                  style: TextStyle(color: Color(0xFFa20000)),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Theme(
                data: new ThemeData(
                    primaryColor: Color(0xFFa20000),
                    accentColor: Color(0xFFa20000),
                    hintColor: Color(0xFFa20000)),
                child: new TextField(
                  controller: noteController,
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
                      labelText: 'Catatan',
                      fillColor: Color(0xFFa20000),
                      prefixIcon: const Icon(
                        Icons.note,
                        color: Color(0xFFa20000),
                      ),
                      suffixStyle: const TextStyle(color: Colors.white)),
                  style: TextStyle(color: Color(0xFFa20000)),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Text(
                    'Simpan Lokasi',
                    style: TextStyle(color: Color(0xFFa20000)),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Switch(
                    value: status1,
                    activeColor: Color(0xFFa20000),
                    onChanged: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Theme(
                data: new ThemeData(
                    primaryColor: Color(0xFFa20000),
                    accentColor: Color(0xFFa20000),
                    hintColor: Color(0xFFa20000)),
                child: new TextField(
                  controller: labelController,
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
                      labelText: 'Label Alamat',
                      fillColor: Color(0xFFa20000),
                      prefixIcon: const Icon(
                        Icons.my_location,
                        color: Color(0xFFa20000),
                      ),
                      suffixStyle: const TextStyle(color: Colors.white)),
                  style: TextStyle(color: Color(0xFFa20000)),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                child: FlatButton(
                  color: Color(0xFFa20000),
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  onPressed: () {
                    if(assignValue())
                      nextPage(context, FormShipping());
                  },
                  child: Text(
                    'Selanjutnya',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool assignValue(){
    if(pickupAddress == null || _date.compareTo("Input Tanggal Pickup") == 0 ||
        _date == "" || _district == null ) {
      alertDialogOK(context, "Error", "Data Belum Lengkap");
      return false;
    }
    if(orderData == null){
      orderData = new Order(
          _date,
          "",
          noteController.text,
          0,
          addressController.text,
          0,
          _district.districtId,
          0,
          pickupAddress.coordinates.latitude,
          pickupAddress.coordinates.longitude,
          0,
          _district.areaId,
          senderController.text,
          phoneController.text,
          status1 ? 1 : 0,
          labelController.text
      );
      orderData.orderItems = new List();
      return true;
    }
    orderData.pickupLatitude = pickupAddress.coordinates.latitude;
    orderData.pickupLongitude = pickupAddress.coordinates.longitude;
    orderData.orderDate = _date;
    orderData.pickupAddress = addressController.text;
    orderData.pickupDistrictId = _district.districtId;
    orderData.senderName = senderController.text;
    orderData.senderPhone = phoneController.text;
    orderData.saveAddress = status1 ? 1 : 0;
    orderData.labelAddress = labelController.text;
    orderData.orderItems = new List();
    return true;
  }

//  bool assignValueDummy(){
//      orderData = new Order(
//          "2020-09-18",
//          "",
//          "Jangan Dibuang",
//          0,
//          "Jl Kenangan",
//          0,
//          _district.districtId,
//          0,
//          -6.932694,
//          107.627449,
//          0,
//          _district.areaId,
//          "Bambang",
//          "098472863844",
//          status1 ? 1 : 0,
//          "Asal",
//      );
//      orderData.orderItems = new List();
//      return true;
//
//  }
}
