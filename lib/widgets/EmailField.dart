import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:email_validator/email_validator.dart';

class EmailFieldwidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String? hintText;
  double? width;
  IconData? icons;
  String? Error;

  EmailFieldwidget({
    required this.controller,
    required this.hintText,
    required this.width,
    required this.icons,
    required this.Error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width,
          child: TextFormField(
              controller: controller,
              validator: (value) {
                return value != null && !EmailValidator.validate(value)
                    ? "${Error}"
                    : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
                labelText: hintText,
                hintStyle: TextStyle(fontSize: 19),
                prefixIcon: Icon(icons),
              )),
        ),
      ],
    );
  }
}
