import 'package:cms_flutter/src/features/auth/data/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initials_provider.g.dart';

@Riverpod(keepAlive: true)
String initials(Ref ref) {
  final user = ref.read(authRepoProvider).currentUser!;
  final splitName = user.name.split(' ');
  print("Split name is " + splitName.toString());
  String initial;
  if (splitName.length >= 2) {
    initial = splitName[0][0] + splitName[splitName.length - 1][0];
    return initial;
  } else if (splitName.length == 1) {
    return splitName[0][0];
  }
  return '';
}
