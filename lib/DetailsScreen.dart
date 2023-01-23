import 'package:e_commerce/CartView.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class Details extends StatefulWidget {
  String? GB;
  String? Price;
  String? Ram;
  String? Type;
  String? Link;
  String? details;

  Details(  {this.Ram, this.Link, this.GB, this.Price, this.Type, this.details});


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  final fireStore = FirebaseFirestore.instance;

  SelectItem(){
     fireStore.collection('CartView').doc(widget.Type).set(

        {
          'Type': widget.Type,
          'img': widget.Link,
          'Price': widget.Price,


        }
    )
    ;}

bool isshow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Back'),
          backgroundColor: Colors.deepPurple[500],
        ),
        body: Column(children: [
          SizedBox(
            height: 8,
          ),
          Text(
            '${widget.Type}',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Container(
                height: 300,
                child: Image.network(
                  '${widget.Link}',
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            '${widget.Price}',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  'New',
                  style: TextStyle(fontSize: 12),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 129, 129),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 23,
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),
                  Icon(
                    Icons.star,
                    size: 23,
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),
                  Icon(
                    Icons.star,
                    size: 23,
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),
                  Icon(
                    Icons.star,
                    size: 23,
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),
                  Icon(
                    Icons.star,
                    size: 23,
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
              ),
              Row(
                children: [
                  Icon(
                    Icons.edit_location,
                    color: Color.fromARGB(168, 3, 65, 27),
                    size: 23,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Mobile Sotre',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            '${widget.details}',
            style: TextStyle(fontSize: 18),
            maxLines: isshow ? 5 : null,
            overflow: TextOverflow.ellipsis,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  isshow = !isshow;
                });
              },
              child: Text(
                isshow ? 'ShowLess' : 'ShowMore',
                style: TextStyle(fontSize: 15),
              )),
          Container(
            width: 150,
            child: ElevatedButton(
                    onPressed: () {
                        SelectItem();
                    },
                    child: Text('ADD'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green)),
                  )
                )
    ,

        ]
    )
    );
  }
}
