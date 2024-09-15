import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/components/custom_button.dart';
import '../../cores/components/custom_textfields.dart';
import 'sign_in_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
              width: 580,
              height: 637,
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: blackColor.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 70)
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 48, right: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        65.heightBox,
                        "Reset Password"
                            .text
                            .size(32)
                            .bold
                            .black
                            .textStyle(GoogleFonts.inter())
                            .make(),
                        7.heightBox,
                        "Please enter your registered email to reset password"
                            .text
                            .size(16)
                            .color(textGrayColor)
                            .textStyle(GoogleFonts.inter())
                            .make(),
                        50.heightBox,
                        customTextField("Email address", grayColor, false, null,
                            null, null, null, false, null),
                        70.heightBox,
                        customButton("Submit", primaryColor, whiteColor,
                            primaryColor.withOpacity(0.36), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ConfigStep1Screen()));
                        }),
                        25.heightBox,
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen()));
                          },
                          child: "Sign In?"
                              .text
                              .size(16)
                              .black
                              .textStyle(GoogleFonts.inter())
                              .make(),
                        )
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
