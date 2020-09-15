import 'package:flutter/material.dart';
import 'package:terang_express/models/user.dart';

String domain = "https://wipick.wiradipa.com";
String apiUrl = domain+"/api/";

User currentUser;

showCircular(context){
  showDialog(
      context: context,
      child: new Center(
        child: new CircularProgressIndicator(),
      )
  );
}

closeCircular(context){
  Navigator.of(context, rootNavigator: true).pop();
}

alertDialog(context, title, message){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(message),
        );
      }
  );
}

nextPage(context, page){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

startNewPage(context, page){
  Navigator.pushAndRemoveUntil(
      context,
      new MaterialPageRoute(
        builder: (context) => page,
      ), (route) => false);
}