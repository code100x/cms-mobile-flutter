import 'package:cms_flutter/src/features/auth/data/auth_repo.dart';
import 'package:cms_flutter/src/features/auth/domain/app_user.dart';
import 'package:cms_flutter/src/features/courses/domain/course.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'courses_repo.g.dart';

class CoursesRepo {
  final Dio dio;
  final AppUser user;
  CoursesRepo(this.dio, this.user);

  Future<List<Course>> getAllCourses() async {
    final response = await dio.get('/courses',
        options: Options(headers: {
          'Authorization': user.token,
        }));

    if (response.data['message'] == "User courses fetched successfully") {
      var allCourses =
          List<Map<String, dynamic>>.from(response.data['data'] as Iterable);

      final List<Course> listedCourses =
          allCourses.map((val) => Course.fromJson(val)).toList();

      return listedCourses;
    } else {
      return [];
    }
  }
}

@Riverpod(keepAlive: true)
CoursesRepo courseRepo(Ref ref) {
  final dio = ref.watch(dioRepoProvider);
  final user = ref.watch(authRepoProvider).currentUser;
  return CoursesRepo(dio, user!);
}

@Riverpod(keepAlive: true)
Future<List<Course>> courses(Ref ref) {
  final courses = ref.watch(courseRepoProvider).getAllCourses();

  return courses;
}
