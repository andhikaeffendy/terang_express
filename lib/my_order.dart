import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_get_orders.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/order.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class _MyOrderState extends State<MyOrder> {

  static List<Order> mainData;
  List<Order> orders = List.from(mainData);
  final searchController = new TextEditingController();

  Future<ApiOrder> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = futureApiGetOrders(currentUser.token);
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
              Text('My Order')
            ],
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: searchController,
                    onChanged: (text) => searchOrder(text),
                    decoration: InputDecoration(
                      hintText: "Search",
                      suffixIcon: IconButton(
                        onPressed: (){
                          searchOrder(searchController.text);
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _future,
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          ApiOrder apiOrder = snapshot.data;
                          if(!apiOrder.isSuccess()) return Container();
                          mainData = apiOrder.orders;
                          return ListView.builder(
                              itemCount: orders.length,
                              shrinkWrap: true,
                              primary: false,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(orders[index].orderNumber),
                                  subtitle: Text(orders[index].orderDate),
                                );
                              });
                        } else {
                          return new Center(
                            child: new CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }

  searchOrder(query){
    setState(() {
      orders = mainData.where((element) => element.orderNumber.contains(query) || element.orderDate.contains(query) ).toList();
    });
  }
}
