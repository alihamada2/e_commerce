import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'DetailsScreen.dart';
class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: fireStore.collection('Category').snapshots(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Column(
                children: [

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Category',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            //
                          },
                          child: Row(
                            children: [
                              Text('See All'),
                              Icon(Icons.arrow_forward)
                            ],
                          ))
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var doc = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 60,
                              height: 50,
                              child: Column(
                                children: [

                                  IconButton(onPressed: (){

                                  },
                                      icon: Image.network(doc['img'])),
                                  Text(
                                    doc['name'],
                                    style: TextStyle(fontSize: 15,),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              )
            : snapshot.hasError
                ? Center(child: Text('Error'))
                : Center(child: CircularProgressIndicator());
      },
    ));
  }
}
