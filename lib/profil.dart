import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_profile.dart';
import 'package:terang_express/drawer_menu.dart';
import 'package:terang_express/edit_password.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/models/profile.dart';

class Profil extends StatefulWidget {

  static const String routeName = '/profil';

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Future<Profile> _future;
  Profile profile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = futureApiProfile(currentUser.token);
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
            Text('Profil')
          ],
        ),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Color(0xFFa20000),
              height: 200.0,
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24.0,
                    ),
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 53,
                        backgroundImage: NetworkImage(domain+currentUser.photoUrl),
                      ),
                    ),SizedBox(
                      height: 16.0,
                    ),Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(3.0, 3.0),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              color: Colors.black38),
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                      ),
                      child: FutureBuilder(
                        future: _future,
                        builder: (context, future){
                          if(future.connectionState == ConnectionState.done){
                            profile = future.data;
                            return profileView();
                          } else {
                            return Center(
                              child: new CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),SizedBox(
                      height: 24.0,
                    ),ButtonTheme(
                      minWidth: double.infinity,
                      child: FlatButton(
                        color: Color(0xFFa20000),
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        onPressed: () => nextPage(context, EditPassword()),
                        child: Text(
                          'Edit Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  profileView(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),Text(
          profile.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 16.0,
        ),Text(
          'Company Name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),Text(
          profile.companyName,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 16.0,
        ),Text(
          'Email',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),Text(
          profile.email,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 16.0,
        ),Text(
          'Nomor Telepon',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),Text(
          profile.hp,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
