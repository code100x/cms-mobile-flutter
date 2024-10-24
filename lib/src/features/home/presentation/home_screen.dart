import 'dart:ui';
import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:cms_flutter/src/common/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/hero_icon.png'),
                      backgroundColor: Colors.blue,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '100xdevs',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: 80,
                        right: 110,
                        child: Transform.rotate(
                          angle: 3.14 / 12.0,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: const Color(0xFF3259E8),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: SvgPicture.asset('assets/svg/react.svg',
                                  height: 20,
                                  width: 20,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                  semanticsLabel: 'React Logo'),
                            ),
                          ),
                        )),
                    const Positioned.fill(
                      top: 100,
                      bottom: -100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Image(
                              image: AssetImage('assets/images/homepage.png')),
                        ),
                      ),
                    ),
                    const Positioned.fill(
                      top: 100,
                      bottom: -100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image(
                            image: AssetImage(
                                'assets/images/iphone_skeleton.png')),
                      ),
                    ),
                    Positioned.fill(
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.white.withOpacity(
                                  1), // More blur effect at the bottom
                            ],
                            stops: const [
                              0.7,
                              1.0
                            ], // Adjust stops for the gradient effect
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(),
                          child: Container(
                            color: Colors.white.withOpacity(
                                1), // Transparent container for the blur
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        left: 100,
                        child: Transform.rotate(
                          angle: 3.14 / 30.0,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: const Color(0xFF83CD29),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: SvgPicture.asset('assets/svg/white_js.svg',
                                  height: 25,
                                  width: 25,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                  semanticsLabel: 'React Logo'),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 30,
                        left: 70,
                        child: Transform.rotate(
                          angle: -3.14 / 12.0,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: const Color(0xFFFBC02D),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: SvgPicture.asset('assets/svg/black_js.svg',
                                  height: 20,
                                  width: 20,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                  semanticsLabel: 'React Logo'),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 30,
                        right: 70,
                        child: Transform.rotate(
                          angle: 3.14 / 12.0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            width: 50,
                            child: Center(
                              child: SvgPicture.asset('assets/svg/mongo_db.svg',
                                  height: 30,
                                  width: 30,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.green,
                                    BlendMode.srcIn,
                                  ),
                                  semanticsLabel: 'React Logo'),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                  color: Colors.black),
                              text: "Be a ",
                              children: [
                                TextSpan(
                                    text: "100xDev ",
                                    style: TextStyle(color: Color(0xFF3B58E0))),
                                TextSpan(text: "because 10x isn't enough")
                              ])),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Unlock your potential with coding cohorts. Learn, collaborate, and grow beyond limits.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(buttonText: "Log In", onPressed: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      SecondaryButton(
                        buttonText: 'Sign Up Now',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
