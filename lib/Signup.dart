import 'package:e_commerce/HomePage.dart';
import 'package:e_commerce/widgets/EmailField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/ShowSnackBar.dart';
import 'widgets/PasswordField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController EmailcontrollerUp = TextEditingController();
  TextEditingController PasswordcontrollerUp = TextEditingController();
  TextEditingController NamecontrollerUp = TextEditingController();
  TextEditingController PhonecontrollerUp = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final fireStore = FirebaseFirestore.instance;
  register(){
    fireStore.collection('SignUp').add(
        {
          'Email': EmailcontrollerUp.text,
          'FUllName': NamecontrollerUp.text,
          'Password': PasswordcontrollerUp.text,
          'Phone': int.parse(PhonecontrollerUp.text),

        }
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'SignUp',
                        style: TextStyle(fontFamily: 'myfont', fontSize: 25),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SvgPicture.asset(
                        'assets/icons/signup.svg',
                        width: 250,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                            controller: NamecontrollerUp,
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(66),
                              ),
                              labelText: 'Full Name: ',
                              labelStyle: TextStyle(fontSize: 19),
                              prefixIcon: Icon(Icons.person_outlined),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailFieldwidget(
                        controller: EmailcontrollerUp,
                        hintText: 'Email: ',
                        width: 200,
                        icons: Icons.email_rounded,
                         Error: 'Enter a valid email'

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PasswordFieldwidget(
                          controller: PasswordcontrollerUp,
                          hintText: 'Password:',
                          width: 210,
                        Error: 'Enter at least 6 characters',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    EmailFieldwidget(
                        controller: PhonecontrollerUp,
                        hintText: 'phone: ',
                        width: 200,
                        icons: Icons.phone,
                         Error: 'Enter a phone Number'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                      if(_formKey.currentState!.validate()){
                        register();

                      }else{
                        ShowSnackBar(context, 'ERROR');
                      }


                        },
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
                        child: Text('SignUp',
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
                  child: Image.asset('assets/images/signup_top.png'),
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
      ),
    );
  }
}
