import 'package:cms_flutter/src/common/purchase_needed_modal.dart';
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
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                'assets/images/course_image.png',
              ),
            ),
            Padding(
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
                      onPressed: () async {
                        // Show modal for purchase
                        // if returns true navigate
                        await purchaseNeededModal(
                            context: context,
                            handleDelete: () {
                              context.pop();
                            });
                        if (mounted) context.go('/courses/1');
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
            )
          ],
        ),
      ),
    );
  }
}
