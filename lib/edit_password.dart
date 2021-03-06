import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_change_password.dart';
import 'package:terang_express/globals/variable.dart';

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordConfirmationController = TextEditingController();

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
            Text('Edit Password')
          ],
        ),
        centerTitle: true,
      ),body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: new ThemeData(
                  primaryColor: Color(0xFFa20000),
                  accentColor: Color(0xFFa20000),
                  hintColor: Color(0xFFa20000)),
              child: new TextField(
                controller: oldPasswordController,
                obscureText: true,
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
                    labelText: 'Password Lama',
                    fillColor: Color(0xFFa20000),
                    prefixIcon: const Icon(
                      Icons.lock_open,
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
                controller: newPasswordController,
                obscureText: true,
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
                    labelText: 'Password Baru',
                    fillColor: Color(0xFFa20000),
                    prefixIcon: const Icon(
                      Icons.lock_open,
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
                controller: newPasswordConfirmationController,
                obscureText: true,
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
                    labelText: 'Konfirmasi Password',
                    fillColor: Color(0xFFa20000),
                    prefixIcon: const Icon(
                      Icons.lock_open,
                      color: Color(0xFFa20000),
                    ),
                    suffixStyle: const TextStyle(color: Colors.white)),
                style: TextStyle(color: Color(0xFFa20000)),
              ),
            ),SizedBox(
              height: 16.0,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              child: FlatButton(
                color: Color(0xFFa20000),
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                onPressed: () {
                  showCircular(context);
                  futureApiChangePassword(currentUser.token, oldPasswordController.text,
                      newPasswordController.text, newPasswordConfirmationController.text)
                      .then((value){
                        closeCircular(context);
                        if(value.isSuccess()){
                          alertDialogOK(context, "Success", value.message)
                              .then((value) => Navigator.of(context).pop());
                        } else alertDialogOK(context, "Error", value.message);

                  });
                },
                child: Text(
                  'Ganti Password',
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
