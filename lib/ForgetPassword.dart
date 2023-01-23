import 'package:e_commerce/widgets/EmailField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Signup.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}



class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController Emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Form(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.png'),
                      radius: 90,
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    EmailFieldwidget(
                      controller: Emailcontroller,
                      hintText: 'Email: ',
                      width: 266,
                      icons: Icons.email_rounded,
                        Error: 'Enter a valid email'
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66),
                          ),
                        ),
                      ),
                      child: Text(
                        'Reset My Password',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account?",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              ' Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                child: Image.asset('assets/images/main_top.png'),
                width: 111,
                left: 0,
              ),
              Positioned(
                child: Image.asset('assets/images/main_bottom.png'),
                width: 111,
                bottom: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
