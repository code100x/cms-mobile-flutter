import 'package:flutter/material.dart';

import 'package:cms_flutter/src/common/primary_button.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key,
      required this.title,
      required this.bannerImage,
      required this.viewContentCallback});
  final Widget bannerImage;
  final String title;
  final VoidCallback viewContentCallback;
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
              child: bannerImage,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  PrimaryButton(
                      buttonText: 'View Content',
                      onPressed: viewContentCallback),
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
