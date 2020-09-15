import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aktifasi.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _value = 1;

  String _valPerusahaan;
  List _listPerusahaan = ["PT Mulia Sejahtera", "PT Kebun Anggrek", 'PT Kabut Biru', 'PT Sayuran Segar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFa20000),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 40.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_small.png',
                    width: 200.0,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        hintColor: Colors.white),
                    child: new TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: 'Full Name',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          suffixStyle: const TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        hintColor: Colors.white),
                    child: new TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: 'No HP',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.local_phone,
                            color: Colors.white,
                          ),
                          suffixStyle: const TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Gender',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _value,
                        activeColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        onChanged: (T) {
                          setState(() {
                            _value = T;
                          });
                        },
                      ),
                      Text(
                        'Pria',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Radio(
                        value: 1,
                        groupValue: _value,
                        activeColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        onChanged: (T) {
                          setState(() {
                            _value = T;
                          });
                        },
                      ),
                      Text(
                        'Wanita',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        hintColor: Colors.white),
                    child: new TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: 'Nama Usaha',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          suffixStyle: const TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: DropdownButton(
                      hint: Text("Pilih Tipe Perusahaan"),
                      isExpanded: true,
                      value: _valPerusahaan,
                      items: _listPerusahaan.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valPerusahaan =
                              value; //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        hintColor: Colors.white),
                    child: new TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: 'Username',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.person_pin,
                            color: Colors.white,
                          ),
                          suffixStyle: const TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        hintColor: Colors.white),
                    child: new TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: 'Email',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                          ),
                          suffixStyle: const TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        hintColor: Colors.white),
                    child: new TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: 'Password',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.lock_open,
                            color: Colors.white,
                          ),
                          suffixStyle: const TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Theme(
                    data: new ThemeData(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        hintColor: Colors.white),
                    child: new TextField(
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: 'Confirm Password',
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.lock_open,
                            color: Colors.white,
                          ),
                          suffixStyle: const TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: FlatButton(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Aktifasi()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
