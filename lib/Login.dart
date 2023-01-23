import 'package:e_commerce/ForgetPassword.dart';
import 'package:e_commerce/HomePage.dart';
import 'package:e_commerce/widgets/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/EmailField.dart';
import 'widgets/PasswordField.dart';
import 'Signup.dart';
import 'ForgetPassword.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  TextEditingController EmailcontrollerLog = TextEditingController();
  TextEditingController PasswordcontrollerLog = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final fireStore = FirebaseFirestore.instance;

   login(){
     fireStore.collection('LogIn').add(
         {
           'Email': EmailcontrollerLog.text,
           'Password': PasswordcontrollerLog.text,
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
        body:Form(
          key: _formKey,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'myfont'),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          SvgPicture.asset(
                            'assets/icons/login.svg',
                            width: 288,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          EmailFieldwidget(
                            controller: EmailcontrollerLog,
                            hintText: 'Email : ',
                            width: 266,
                            icons: Icons.email_rounded,
                              Error: 'Enter a valid email'
                          ),
                          SizedBox(height: 15,),
                          PasswordFieldwidget(
                              controller: PasswordcontrollerLog,
                              hintText: 'Password :',
                              width: 266,
                              Error: 'Enter at least 6 characters'
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // if(_formKey.currentState!.validate()){
                              //   login();
                              //
                              //
                              // }else{
                              //   ShowSnackBar(context, 'ERROR');
                              // }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ),
                              );
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
                            child: Text('LogIn',
                              style: TextStyle(
                                fontSize: 20,

                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have an Account?",
                                style: TextStyle(fontSize: 15),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return SignUp();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    ' Sign Up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ForgetPassword();
                                    },
                                  ),
                                );
                              },
                              child: Text('Forget Password?'))
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Image.asset('assets/images/main_top.png'),
                      width: 111,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset('assets/images/login_bottom.png'),
                      width: 111,
                    ),
                  ],
                ),
              ),
            ),

        ),
      );
  }
}
