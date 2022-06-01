import 'package:flutter/material.dart';
import 'package:jobqo/shared/shared.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final bool obs;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hint,
    this.obs = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obs,
            decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ))),
          ),
        ],
      ),
    );
  }
}
