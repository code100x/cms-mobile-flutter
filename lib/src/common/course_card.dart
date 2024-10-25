import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cms_flutter/src/common/primary_button.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({super.key});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 420,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE2E8F0)),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/course_image.png',
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Cohort 3.0 | Web Dev",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Stack(
                              children: [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: CircularProgressIndicator(
                                    value: 0.4,
                                    color: Color(0xFF00823E),
                                    backgroundColor: Color(0x2200823E),
                                  ),
                                ),
                                Positioned.fill(
                                    child: Center(
                                        child: Text(
                                  '40%',
                                  style: TextStyle(fontSize: 10),
                                )))
                              ],
                            ),
                          )
                        ],
                      ),
                      PrimaryButton(
                          buttonText: 'View Content',
                          onPressed: () {
                            context.go('/courses/1');
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: InkWell(
                          onTap: () {},
                          child: const Center(
                              child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.people_outlined,
                                color: Color(0xFF64748B),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Join Discord Community',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF64748B)),
                              )
                            ],
                          )),
                        ),
                      )
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
