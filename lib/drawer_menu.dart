import 'package:flutter/material.dart';
import 'package:terang_express/apis/api_logout.dart';
import 'package:terang_express/globals/session.dart';
import 'package:terang_express/globals/variable.dart';
import 'package:terang_express/login.dart';
import 'package:terang_express/routes.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget> [
          UserAccountsDrawerHeader(
            accountEmail: Text(currentUser.email),
            accountName: Text(
              currentUser.name
            ),
            currentAccountPicture: CircleAvatar(
              child: Image.network(domain+currentUser.photoUrl),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home'
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),ListTile(
            leading: Icon(Icons.person),
            title: Text(
                'Profil'
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.profil),
          ),ListTile(
            leading: Icon(Icons.person),
            title: Text(
                'Promo'
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.promo),
          ),ListTile(
            leading: Icon(Icons.data_usage),
            title: Text(
                'Adress'
            ),onTap: () => Navigator.pushReplacementNamed(context, Routes.address),
          ),ListTile(
            leading: Icon(Icons.data_usage),
            title: Text(
                'About Us'
            ),onTap: () => Navigator.pushReplacementNamed(context, Routes.aboutUs),
          ),ListTile(
            leading: Icon(Icons.data_usage),
            title: Text(
                'Contact Us'
            ),onTap: () => Navigator.pushReplacementNamed(context, Routes.contactUs),
          ),ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
                'Sign Out'
            ),onTap: (){
              showCircular(context);
              futureApiLogout(currentUser.token).then((value){
                closeCircular(context);
                currentUser = null;
                destroySession();
                startNewPage(context, Login());
            });
          },
          ),
        ],
      ),
    );
  }
}
