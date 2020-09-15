import 'package:flutter/material.dart';

class ItemOrder extends StatefulWidget {
  @override
  _ItemOrderState createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  List<String> litems = ["1", "2", "Third", "4"];

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
            Text('Shipping')
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: litems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('dropbox_logo.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Baju Lebaran',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                            ),
                            ),SizedBox(
                              height: 8.0,
                            ),Text(
                              'Nama Pengirim : $litems',
                              style: TextStyle(
                                fontSize: 14.0
                              ),
                            ),SizedBox(
                              height: 8.0,
                            ),Text(
                              'Nama Penerima : $litems',
                              style: TextStyle(
                                  fontSize: 14.0
                              ),
                            ),SizedBox(
                              height: 8.0,
                            ),Text(
                              'Rp. 20.000',
                              style: TextStyle(
                                  fontSize: 14.0
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
