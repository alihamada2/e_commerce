import 'package:e_commerce/About.dart';
import 'package:e_commerce/HomePage.dart';
import 'package:flutter/material.dart';

class menuPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                  AssetImage('assets/images/ecommerce.png'),
                  fit: BoxFit.cover),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 52,
              backgroundImage:
              AssetImage('assets/images/man.png'),
            ),
            accountEmail: Text(
                'alihendy8@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            accountName: Text(
              'ali',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              }),
          ListTile(
              title: Text("About"),
              leading: Icon(Icons.help_center),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return About();
                    },
                  ),
                );
              }),
          ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}