import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

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
                    decoration: InputDecoration(
                      hintText: "Search",
                      suffixIcon: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: litems.length,
                        shrinkWrap: true,
                        primary: false,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Judul'),
                            subtitle: Text('nama perusahaan'),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
