import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_create_order.dart';
import 'package:terang_express/form_shipping.dart';
import 'package:terang_express/globals/order_data.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/main.dart';
import 'package:terang_express/models/order_item.dart';

class ItemOrder extends StatefulWidget {
  @override
  _ItemOrderState createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  List<OrderItem> orderItems;

  @override
  void initState() {
    // TODO: implement initState
    orderItems = orderData.orderItems;
    super.initState();
  }

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
      body: Column(
        children: [
          Expanded (
              child: ListView.builder(
                itemCount: orderItems.length,
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
                                'Ukuran : ' + orderItems[index].getGoodSizeName(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0
                              ),
                              ),SizedBox(
                                height: 8.0,
                              ),Text(
                                'Nama Penerima : ' + orderItems[index].receiverName,
                                style: TextStyle(
                                  fontSize: 14.0
                                ),
                              ),SizedBox(
                                height: 8.0,
                              ),Text(
                                'Kota Penerima : ' + orderItems[index].receiverDistrictName,
                                style: TextStyle(
                                    fontSize: 14.0
                                ),
                              ),SizedBox(
                                height: 8.0,
                              ),Text(
                                getCurrency(orderItems[index].receiverEstimationValue),
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
                }
              )
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: FlatButton(
                color: Color(0xFFa20000),
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                onPressed: () async {
                  readyToSubmit = true;
                  OrderItem orderItem = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        FormShipping()),
                  );
                  if(orderItem != null) {
                    setState(() {
                      orderData.orderItems.add(orderItem);
                      orderData.recalculateValue();
                    });
                  }
                },
                child: Text(
                  'Tambah Kiriman',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: FlatButton(
                color: Color(0xFFa20000),
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                onPressed: () {
                  showCircular(context);
                  futureApiCreateOrder(currentUser.token, orderData.toStringJson()).then((value){
                    closeCircular(context);
                    if(value.isSuccess()){
                      alertDialogOK(context, "Sukses", value.message).then((value){
                        startNewPage(context, MyApp());
                      });
                    } else alertDialogOK(context, "Error", value.message);
                  });
                },
                child: Text(
                  'Pick Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
