import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  late SharedPreferences prefs;
  Future<void> _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool("darkMode");
    state = darkMode ?? false;
  }

  DarkModeNotifier() : super(false) {
    _init();
  }
  void toggle() async {
    state = !state;
    prefs.setBool("darkMode", state);
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
