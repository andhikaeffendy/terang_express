import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_reset_password.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/login.dart';
import 'package:terang_express/register.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFa20000),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo_small.png',
                      width: 200.0,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'LUPA PASSWORD?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),SizedBox(
                      height: 24.0,
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
                                borderSide:
                                    new BorderSide(color: Colors.white)),
                            labelText: 'Email Anda',
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
                    ButtonTheme(
                      minWidth: double.infinity,
                      child: FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        onPressed: () {
                          showCircular(context);
                          futureApiResetPassword(emailController.text).then((value){
                            closeCircular(context);
                            if(value.isSuccess()){
                              alertDialogOK(context, value.status, value.message);
                            } else alertDialog(context, "error", value.message);
                          });
                        },
                        child: Text(
                          'Kirimkan Intruksi Reset Password',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                    ),SizedBox(
                      height: 24.0,
                    ),Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => startNewPage(context, Login()),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Text(
                          ' | ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),GestureDetector(
                          onTap: ()=> startNewPage(context, Register()),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.0,
                    ), GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        'Belum menerima email konfirmasi?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
