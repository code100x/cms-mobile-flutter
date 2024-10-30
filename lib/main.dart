import 'package:cms_flutter/src/app.dart';
import 'package:cms_flutter/src/features/auth/data/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  try {
    // Pre-fetch the signed-in user data
    final val = await container.read(authRepoProvider).getSignedInUser();
    print('read the getSignedInUser $val');
  } catch (e) {
    print("Error initializing user: $e");
  }
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MainApp(),
  ));
}
