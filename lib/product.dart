import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/DetailsScreen.dart';
import 'package:flutter/material.dart';



class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: fireStore.collection('product').snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot img = snapshot.data!.docs[index];
                  return Stack(

                    children: [
                      Container(

                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        height: 190,
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 166,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(255, 169, 152, 219),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding:
                                EdgeInsets.symmetric(horizontal: 20),
                                height: 160,
                                width: 200,
                                child: Image.network(
                                  img['Link']
                                  ,

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 35,
                              right: 5,
                              child: SizedBox(
                                  height: 166,
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Type: ${snapshot.data!
                                            .docs[index]['Type']}',
                                        style: TextStyle(
                                            fontFamily: 'myfont',
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'GB: ${snapshot.data!
                                            .docs[index]['GB']}',
                                        style: TextStyle(
                                            fontFamily: 'myfont',
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Ram: ${snapshot.data!
                                            .docs[index]['Ram']}',
                                        style: TextStyle(
                                            fontFamily: 'myfont',
                                            fontSize: 15),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(22)),
                                        child: Text(
                                          'Price: ${snapshot.data!
                                              .docs[index]['Price']}',
                                          style: TextStyle(
                                              fontFamily: 'myfont',
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  )),
                            ),
                            Positioned(
                              right: 40,
                              bottom: 15,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Details(
                                          Type: '${snapshot.data!
                                              .docs[index]['Type']}',
                                          GB: '${snapshot.data!
                                              .docs[index]['GB']}',
                                          Link:'${img['Link']}',
                                          Ram:'${snapshot.data!
                                              .docs[index]['Ram']}',
                                          Price:'${snapshot.data!
                                              .docs[index]['Price']}',
                                          details: ' ${snapshot.data!
                                              .docs[index]['Details']}',
                                        );
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                            Positioned(
                                right: 40,
                                bottom: 15,
                                child: OutlineButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Details(
                                              Type: '${snapshot.data!
                                                  .docs[index]['Type']}',
                                              GB: '${snapshot.data!
                                                  .docs[index]['GB']}',
                                              Link:'${img['Link']}',
                                              Ram:'${snapshot.data!
                                                  .docs[index]['Ram']}',
                                              Price:'${snapshot.data!
                                                  .docs[index]['Price']}',
                                            details: ' ${snapshot.data!
                                                .docs[index]['Details']}',
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Buy',
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30.0),
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })
                : snapshot.hasError
                ? Center(child: Text('Error'))
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
