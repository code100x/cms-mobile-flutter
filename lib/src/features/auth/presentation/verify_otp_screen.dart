import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // TODO: Navigate back to the prev screen
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Verify OTP",
              style: TextStyle(
                  fontSize: 32, height: 2, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We have sent an OTP to +916100001120",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Form(
                  child: SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                        child: TextFormField(
                      maxLength: 1,
                      decoration: _otpInputDecorarion(),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    FittedBox(
                        child: TextFormField(
                      maxLength: 1,
                      enableSuggestions: false,
                      decoration: _otpInputDecorarion(),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    FittedBox(
                        child: TextFormField(
                      maxLength: 1,
                      decoration: _otpInputDecorarion(),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    FittedBox(
                        child: TextFormField(
                      maxLength: 1,
                      decoration: _otpInputDecorarion(),
                    )),
                  ],
                ),
              )),
            ),
            const Text(
              'Resend OTP in 43s',
              style: TextStyle(fontSize: 16),
            ),
            RichText(
                text: const TextSpan(
                    text: 'Didn\'t Receive and OTP ? ',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                  TextSpan(
                      text: 'Resend',
                      style: TextStyle(color: Color(0xFF3B58E0)))
                ])),
            const SizedBox(
              height: 40,
            ),
            PrimaryButton(buttonText: 'Verify OTP', onPressed: () {})
          ],
        ),
      ),
    );
  }

  InputDecoration _otpInputDecorarion() {
    return const InputDecoration(
        counterText: '',
        counterStyle: TextStyle(fontSize: 0),
        constraints: BoxConstraints(maxWidth: 60),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        floatingLabelBehavior: FloatingLabelBehavior.never);
  }
}
