import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_company_types.dart';
import 'package:terang_express/apis/api_register.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/company_type.dart';

import 'aktifasi.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String selectedGender = "M";
  int selectedCompanyTypeId = 0;

  List<CompanyType> companyTypes;
  Future<ApiCompanyType> _future;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final companyController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = futureApiCompanyTypes();
  }

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
                      controller: nameController,
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
                      controller: phoneController,
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
                        value: "M",
                        groupValue: selectedGender,
                        activeColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        onChanged: (T) {
                          setState(() {
                            selectedGender = "M";
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
                        value: "F",
                        groupValue: selectedGender,
                        activeColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        onChanged: (T) {
                          setState(() {
                            selectedGender = "F";
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
                      controller: companyController,
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
                    child: FutureBuilder(
                      future: _future,
                      builder: (context, snapshot){
                        companyTypes = new List();
                        companyTypes.add(CompanyType(0,"-- Pilih Tipe Perusahaan -- ",""));
                        if(snapshot.hasData){
                          ApiCompanyType apiCompanyType = snapshot.data;
                          companyTypes.addAll(apiCompanyType.companyTypes);
                        }
                        return DropdownButton(
                          hint: Text("Pilih Tipe Perusahaan"),
                          isExpanded: true,
                          value: selectedCompanyTypeId,
                          items: companyTypes.map((value) {
                            return DropdownMenuItem(
                              child: Text(value.name),
                              value: value.id,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCompanyTypeId = value;
                            });
                          },
                        );
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
                      controller: usernameController,
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
                      controller: emailController,
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
                      controller: passwordController,
                      obscureText: true,
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
                      controller: passwordConfirmationController,
                      obscureText: true,
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
                        showCircular(context);
                        futureApiRegister(usernameController.text, nameController.text,
                            emailController.text, passwordController.text,
                            passwordConfirmationController.text, phoneController.text,
                            selectedGender, companyController.text, selectedCompanyTypeId).then((value){
                            closeCircular(context);
                            if(value.isSuccess()){
                              startNewPage(context, Aktifasi());
                            } else alertDialogOK(context, "Error", value.message);
                            });
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
