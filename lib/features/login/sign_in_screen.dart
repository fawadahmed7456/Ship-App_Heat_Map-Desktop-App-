import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_heat_managment_app/cores/colors/colors.dart';
import 'package:ship_heat_managment_app/features/configuration/config_step1_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../cores/components/custom_button.dart';
import '../../cores/components/custom_textfields.dart';
import 'providers/auth_provider.dart';
import 'reset_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                    blurRadius: 70,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 48, right: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    65.heightBox,
                    'LOGO'
                        .text
                        .size(48)
                        .bold
                        .black
                        .textStyle(const TextStyle(fontWeight: FontWeight.bold))
                        .make(),
                    47.heightBox,
                    'Sign In'
                        .text
                        .size(32)
                        .bold
                        .black
                        .textStyle(const TextStyle(fontWeight: FontWeight.bold))
                        .make(),
                    7.heightBox,
                    'Please enter your registered email and password'
                        .text
                        .size(16)
                        .color(textGrayColor)
                        .textStyle(const TextStyle(fontWeight: FontWeight.bold))
                        .make(),
                    40.heightBox,
                    customTextField('Email address', grayColor, false, null,
                        null, emailController, null, false, null),
                    34.heightBox,
                    Consumer(
                      builder: (context, AuthProvider auth, child) {
                        return customTextField(
                            'Password',
                            grayColor,
                            !auth.visibility,
                            null,
                            IconButton(
                                onPressed: () {
                                  auth.setVisibility(!auth.visibility);
                                },
                                icon: auth.visibility
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            passwordController,
                            null,
                            false,
                            null);
                      },
                    ),
                    51.heightBox,
                    Consumer(
                      builder: (context, AuthProvider authProvider, _) =>
                          customButton('Sign in', primaryColor, whiteColor,
                              primaryColor.withOpacity(0.36), () {
                        if (!authProvider.isEmailValid(emailController.text)) {
                          VxToast.show(context, msg: "Invalid Email");
                        } else if (!authProvider
                            .isPasswordValid(passwordController.text)) {
                          VxToast.show(context, msg: "Invalid Password");
                        } else {
                          authProvider.setEmail(emailController.text);
                          authProvider.setPassword(passwordController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ConfigStep1Screen()));
                        }
                      }),
                    ),
                    25.heightBox,
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordScreen()));
                      },
                      child: 'Forgot Password?'
                          .text
                          .size(16)
                          .black
                          .textStyle(
                              const TextStyle(fontWeight: FontWeight.bold))
                          .make(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
