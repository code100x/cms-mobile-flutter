import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreeen extends StatefulWidget {
  const EditProfileScreeen({super.key});
  @override
  State<StatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreeen> {
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
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 32,
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
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                        buttonText: 'Update Profile',
                        onPressed: () {
                          // TODO: add logic to update profile
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
