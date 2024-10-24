import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Flexible(
                    flex: 3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // TODO: replace with logo image later
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 5,
                              ),
                              // TODO: style the text
                              Text('100xdevs'),
                            ],
                          ),
                        ],
                      ),
                    )),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                          text: const TextSpan(
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        text: "Be a 100xDev because 10x isn't enough",
                      )),
                      const Text(
                          'Unlock your potential with coding cohorts. Learn, collaborate, and grow beyond limits.'),
                      ElevatedButton(
                          onPressed: () => {},
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                      OutlinedButton(
                          style: const ButtonStyle(),
                          onPressed: () => {},
                          child: const Text(
                            'Sign Up Now',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
