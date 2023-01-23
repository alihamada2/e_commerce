import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class PasswordFieldwidget extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String? hintText;
  double? width;

  String? Error;

  PasswordFieldwidget(
      {required this.controller,
        required this.hintText,
        required this.width,
      required this.Error,
      });

  @override
  State<PasswordFieldwidget> createState() => _PasswordFieldwidgetState();
}

class _PasswordFieldwidgetState extends State<PasswordFieldwidget> {
 bool isvisable=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: widget.width,
          child: TextFormField(
              validator: (value) {
                return value!.length < 8 ? "${widget.Error}" : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller,
              obscureText: isvisable? true: false ,
              decoration: InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
               labelText: widget.hintText,
                hintStyle: TextStyle(fontSize: 19),
                prefixIcon: Icon( Icons.lock ),
                suffixIcon: IconButton(
                  onPressed: (){

                 setState(() {
                        isvisable = !isvisable;
                      });
          }
                ,icon: isvisable? Icon(Icons.visibility_off) :  Icon(Icons.visibility) ),
              )),
        ),
      ],
    );
  }
}
