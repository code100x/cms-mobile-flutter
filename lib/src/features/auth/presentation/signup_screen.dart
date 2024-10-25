import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:cms_flutter/src/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/landing');
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up Now",
                  style: TextStyle(
                      fontSize: 32, height: 2, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Join the coding revolution and become a 100xDev today.',
                  style: TextStyle(fontSize: 18),
                ),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _formLabel("Name"),
                    TextFormField(
                      decoration: _fieldDecoration("Enter Your Name"),
                    ),
                    _formLabel("Phone Number"),
                    TextFormField(
                      decoration: _fieldDecoration("Enter Phone Number"),
                    ),
                    _formLabel("Email Address"),
                    TextFormField(
                      decoration: _fieldDecoration("Enter Email Address"),
                    ),
                    _formLabel("Password"),
                    TextFormField(
                      decoration: _fieldDecoration("Enter Your Password"),
                    ),
                    _formLabel("State"),
                    TextFormField(
                      decoration: _fieldDecoration("Select State"),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (val) {},
                            checkColor: CommonPallet.primaryButtonBG,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "I agree with ",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color),
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // TODO: Open the terms and conditions or link to browsers webpage
                                      },
                                    text: 'Terms & Conditions',
                                    style: const TextStyle(
                                        color: CommonPallet.primaryButtonBG))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    PrimaryButton(buttonText: 'Sign Up', onPressed: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Open the terms and conditions or link to browsers webpage
                                  },
                                text: 'Log In',
                                style: const TextStyle(
                                    color: CommonPallet.primaryButtonBG))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _formLabel(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
      child: Text(
        labelText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  InputDecoration _fieldDecoration(String placeHolder) {
    return InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: placeHolder,
        floatingLabelBehavior: FloatingLabelBehavior.never);
  }
}
