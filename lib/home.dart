import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_districts.dart';
import 'package:terang_express/drawer_menu.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/my_order.dart';
import 'package:terang_express/order_form.dart';

class Home extends StatefulWidget {

  static const String routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    if(districts.length == 0){
      futureApiDistricts(currentUser.token).then((value){
        if(value.isSuccess())districts = value.districts;
      });
    }
    super.initState();
  }

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
            Text('Home')
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => nextPage(context, OrderForm()),
                  child: Image.asset('assets/button_deliver.png', fit: BoxFit.fill, width: 250.0),
                ),
                SizedBox(
                  height: 40.0,
                ),
                // ButtonTheme(
                //   minWidth: 200.0,
                //   child: FlatButton(
                //     color: Color(0xFFa20000),
                //     padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                //     onPressed: (){},
                //
                //     child: Text(
                //       'CEK TARIF',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 16.0
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 8.0,
                // ),
                ButtonTheme(
                  minWidth: 200.0,
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    color: Color(0xFFa20000),
                    onPressed: ()=>nextPage(context, MyOrder()),
                    child: Text(
                      'MY ORDER',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 8.0,
                // ),
                // ButtonTheme(
                //   minWidth: 200.0,
                //   child: FlatButton(
                //     padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                //     color: Color(0xFFa20000),
                //     onPressed: (){},
                //
                //     child: Text(
                //       'CEK RESI',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //           fontSize: 16.0
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
