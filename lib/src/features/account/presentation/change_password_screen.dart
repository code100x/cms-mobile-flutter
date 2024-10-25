import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  @override
  State<StatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 22,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Back',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          leadingWidth: 100),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 24,
                    height: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _formLabel("Current Password"),
                    TextFormField(
                      decoration: _fieldDecoration("Enter Current Password"),
                    ),
                    _formLabel("New Password"),
                    TextFormField(
                      decoration: _fieldDecoration("Enter New Password"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                        buttonText: 'Update Password',
                        onPressed: () {
                          // TODO: add logic to update password
                        })
                  ],
                )),
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
