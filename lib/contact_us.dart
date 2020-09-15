import 'package:flutter/material.dart';
import 'package:terang_express/drawer_menu.dart';

class ContactUs extends StatefulWidget {

  static const String routeName = '/contactUs';

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
            Image.asset('assets/logo_small.png', width: 35.0,fit: BoxFit.fitWidth),
            SizedBox(
              width: 8.0,
            ),
            Text('Contact Us')
          ],
        ),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hubungi kami :',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    '022 - 7510194 (Customer Service)',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                    ),
                  ),SizedBox(
                    height: 24.0,
                  ),Text(
                    'PT Wiradipa Nusantara',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    'Jalan Batununggal Mulia X No. 9',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    'Bandung, Jawa Barat',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    'Indonesia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
