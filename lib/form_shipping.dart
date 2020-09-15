import 'package:flutter/material.dart';
import 'package:terang_express/item_order.dart';

import 'mapsview.dart';

class FormShipping extends StatefulWidget {
  @override
  _FormShippingState createState() => _FormShippingState();
}

class _FormShippingState extends State<FormShipping> {

  int selectRadioBtn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRadioBtn = 0;
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
            ),SizedBox(
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
                    labelText: 'Lokasi Penerima',
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
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.contact_phone,
                        color: Color(0xFFa20000),),
                    ),
                    suffixStyle: const TextStyle(color: Colors.white)),
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
              title: Text('Radio 1'),
              onChanged: (val){
                setSelectedRadio(val);
              },
            ),RadioListTile(
              value: 2,
              groupValue: selectRadioBtn,
              activeColor: Color(0xFFa20000),
              title: Text('Radio 2'),
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
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemOrder()),
                  );
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
}
