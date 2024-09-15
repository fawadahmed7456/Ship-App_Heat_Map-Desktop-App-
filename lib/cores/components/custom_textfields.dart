import 'package:flutter/material.dart';

import '../colors/colors.dart';

Widget customTextField(String? hint, fillColor, bool isPass, Widget? prefixIcon,
    Widget? suffixIcon, controller, onChange, isreadOnly, validation) {
  return Column(
    children: [
      TextFormField(
        controller: controller, 
        obscureText: isPass,
        readOnly: isreadOnly,
        onChanged: onChange,
        validator: validation,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(color: textGrayColor),
          hintText: hint,
          fillColor: fillColor,
          filled: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.only(left: 20, top: 24, bottom: 24, right: 24),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: whiteColor)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: primaryColor, width: 2)),
        ),
      )
    ],
  );
}
