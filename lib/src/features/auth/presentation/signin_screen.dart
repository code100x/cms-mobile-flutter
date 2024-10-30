import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:cms_flutter/src/features/auth/data/auth_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go("/landing");
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _formLabel("Email Address / Phone No."),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return "Please enter a valid email";
                        }

                        return null;
                      },
                      decoration:
                          _fieldDecoration("Enter Email Address / Phone No."),
                    ),
                    _formLabel("Password"),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: passwordController,
                      validator: (value) {
                        if (value == "") {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                      decoration: _fieldDecoration("Enter Password"),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    PrimaryButton(
                        buttonText: 'Log In',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await ref
                                .read(authRepoProvider)
                                .signInWithEmailAndPassword(
                                    email: emailController.value.text,
                                    password: passwordController.value.text)) {
                            } else {
                              Scaffold.of(context).showBottomSheet((context) {
                                return SnackBar(
                                    content: Text("Some thing went wrong"));
                              });
                            }
                          }
                        }),
                    const SizedBox(
                      height: 20,
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
