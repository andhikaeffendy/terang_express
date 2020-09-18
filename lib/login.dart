import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_login.dart';
import 'package:terang_express/forgot_password.dart';
import 'package:terang_express/globals/session.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/main.dart';
import 'package:terang_express/register.dart';
import 'package:terang_express/splash_screen.dart';

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final usernameEditTextController = TextEditingController();
  final passwordEditTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//    usernameEditTextController.text = "mreza";
//    passwordEditTextController.text = "mreza123";
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFa20000),
          ),
          Positioned(
            bottom: 30.0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Develop By ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                    ),
                  ),Text(
                    'Wiradipa Nusantara',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            )
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
                    Theme(
                      data: new ThemeData(
                          primaryColor: Colors.white,
                          accentColor: Colors.white,
                          hintColor: Colors.white
                      ),
                      child: new TextField(
                        controller: usernameEditTextController,
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),

                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)),
                            labelText: 'Username',
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            suffixStyle: const TextStyle(color: Colors.white)),
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Theme(
                      data: new ThemeData(
                          primaryColor: Colors.white,
                          accentColor: Colors.white,
                          hintColor: Colors.white
                      ),
                      child: new TextField(
                        obscureText: true,
                        controller: passwordEditTextController,
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
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
                        style: TextStyle(
                            color: Colors.white
                        ),
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
                        onPressed: (){
                          showCircular(context);
                          futureApiLogin(usernameEditTextController.text, passwordEditTextController.text)
                              .then((value){
                                closeCircular(context);
                                if(value.isSuccess()){
                                  currentUser = value.user;
                                  saveSession();
                                  startNewPage(context, MyApp());
                                } else {
                                  alertDialog(context, "Failed", value.message);
                                }
                          });
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                          ),
                        ),
                      ),
                    ),SizedBox(
                      height: 24.0,
                    ),Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => nextPage(context, Register()),
                          child: Text(
                            'Sign Up',
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
                          onTap: ()=> nextPage(context, ForgotPassword()),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    )
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
