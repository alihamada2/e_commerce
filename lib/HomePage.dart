import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/CartView.dart';
import 'package:e_commerce/Category.dart';
import 'package:e_commerce/menuPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('E-Commerce'),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(tabs: [
              Tab(
                  icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
              Tab(
                icon: Icon(Icons.category, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.add_shopping_cart, color: Colors.white),
              ),
              Tab(
                  icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
            ]),
          ),
          body: TabBarView(
            children: [
              Product(),
              Category(),
              CartView(),
              menuPage(),

            ],
          ),
        ),
      ),
    );
  }
}
