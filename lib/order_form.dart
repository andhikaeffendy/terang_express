import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:terang_express/form_shipping.dart';
import 'package:terang_express/introduction_screen.dart';
import 'package:terang_express/mapsview.dart';

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  DateTime selectedDate = DateTime.now();
  String _date = "Input Tanggal Pickup";
  bool status1 = false;

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
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapsView()),
                  );
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
                        onPressed: () {},
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormShipping()),
                    );
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
}
