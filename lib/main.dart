import 'package:flutter/material.dart';
import 'package:terang_express/home.dart';
import 'package:terang_express/login.dart';
import 'package:terang_express/routes.dart';

void main() {
  runApp(StartApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.getRoutes(context),
      initialRoute: Home.routeName,
      title: 'Terang Express',
      theme: ThemeData(
        primaryColor: Color(0xFFa20000),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
