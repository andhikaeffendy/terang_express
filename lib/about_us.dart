import 'package:flutter/material.dart';
import 'package:terang_express/drawer_menu.dart';

class AboutUs extends StatefulWidget {

  static const String routeName = '/aboutUs';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
            Text('About Us')
          ],
        ),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Terang Express adalah sebuah aplikasi untuk mengirimkan barang kepada pelanggan tanpa harus pergi dan mengantri di agen kurir yang di inginkan'
                          '. Semua layanan dalam Terang Express adalah GRATIS.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                      ),
                    ),
                  ),Container(
                    child: Text(
                      'Semua pelanggan berhak mendapatkan resi (AWB) di hari yang sama. Selain itu terang express memiliki fitur lacak guna mengetahui posisi kurir maupun barang anda.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
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
