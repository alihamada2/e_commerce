import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {


  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {


  final fireStore = FirebaseFirestore.instance;

  delete( String a){
    fireStore.collection('CartView').doc(a).delete();

  }

  int count = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStore.collection('CartView').snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot img = snapshot.data!.docs[index];
                      return Container(
                          height: 140,
                          child: Row(
                            children: [

                              Image.network(
                                img['img'],
                                fit: BoxFit.fill,
                              ),
                              IconButton(
                                  onPressed: () {
                                    delete('${snapshot.data!.docs[index]['Type']}');
                                  },
                                  icon: Icon(Icons.delete)),
                              Column(
                                children: [
                                  Text(
                                    ' ${snapshot.data!.docs[index]['Type']}',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Price: ${snapshot.data!.docs[index]['Price']}',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 140,
                                        color: Colors.grey.shade200,
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    count++;
                                                  });
                                                },
                                                icon: Icon(Icons.add,
                                                    color: Colors.black)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '$count',
                                              textAlign: TextAlign.center,
                                              style:
                                              TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if(count>0){
                                                      count--;
                                                    }
                                                  });;
                                                },
                                                icon: Icon(
                                                  Icons.minimize,
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'TOTAL',
                          style:
                          TextStyle(color: Colors.grey, fontSize: 22),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '280',
                          style: TextStyle(
                              color: Colors.green, fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    Container(
                        width: 130,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('CHECKOUt'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.green)),
                        )),
                  ],
                ),
              )
            ],
          )
              : snapshot.hasError
              ? Center(child: Text('Error'))
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


