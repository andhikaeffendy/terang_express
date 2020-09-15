import 'package:flutter/material.dart';
import 'package:terang_express/address_form.dart';
import 'package:terang_express/drawer_menu.dart';

class Adress extends StatefulWidget {
  static const String routeName = '/address';

  @override
  _AdressState createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  List<String> litems = ["1", "2", "Third", "4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
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
              Text('Address')
            ],
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFa20000),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddressForm()),
            );
          },
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: litems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Judul'),
                    subtitle: Text('nama perusahaan'),
                  );
                })
          ],
        ));
  }
}
