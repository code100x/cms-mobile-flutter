import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login Now",
              style: TextStyle(
                  fontSize: 32, height: 2, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Login to access your coding cohorts and continue your journey.',
              style: TextStyle(fontSize: 18),
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _formLabel("Email Address / Phone No."),
                TextFormField(
                  decoration:
                      _fieldDecoration("Enter Email Address / Phone No."),
                ),
                _formLabel("Password"),
                TextFormField(
                  decoration: _fieldDecoration("Enter Password"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: RichText(
                    text: TextSpan(
                        text: "Forgot Password?",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO: Open the forgot password flow.
                          },
                        style:
                            const TextStyle(color: Color(0xFF3B58E0), fontSize: 16)),
                  ),
                ),
                PrimaryButton(buttonText: 'Log In', onPressed: () {}),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: Navigate to sign up page
                              },
                            text: 'Sign Up',
                            style: const TextStyle(color: Color(0xFF3B58E0)))
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Padding _formLabel(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
      child: Text(
        labelText,
        style: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
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
