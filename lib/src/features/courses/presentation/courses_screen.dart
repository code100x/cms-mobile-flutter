import 'package:cms_flutter/src/common/course_card.dart';

import 'package:cms_flutter/src/features/courses/data/courses_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoursesScreen extends ConsumerStatefulWidget {
  const CoursesScreen({super.key});

  @override
  ConsumerState<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends ConsumerState<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(coursesProvider);
    return courses.when(
      error: (error, stackTrace) {
        print(stackTrace.toString());
        return const Center(
          child: Text('Something went wrong'),
        );
      },
      loading: () {
        return Scaffold(
          body:
              SafeArea(child: Center(child: const CircularProgressIndicator())),
        );
      },
      data: (data) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.separated(
                itemBuilder: (context, i) {
                  final course = data[i];
                  return CourseCard(
                    title: course.title,
                    bannerImage: Image.network(course.imageUrl),
                    viewContentCallback: () {
                      context.go("/courses/${course.id}");
                    },
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 30,
                  );
                },
                itemCount: data.length),
            // child: ListView(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: 8.0),
            //       child: Text(
            //         'My Courses',
            //         style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 30,
            //     ),
            //     CourseCard(
            //       bannerImage: Image.asset(
            //         'assets/images/course_image.png',
            //       ),
            //       viewContentCallback: () => context.go('/courses/1'),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     CourseCard(
            //       bannerImage: SizedBox(
            //         height: 200,
            //         child: Center(
            //           child: Text("Something went wrong"),
            //         ),
            //       ),
            //       viewContentCallback: () => context.go('/courses/1'),
            //     ),
            //   ],
            // ),
          )),
        );
      },
    );
  }
}
