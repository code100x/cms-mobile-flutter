import 'package:cms_flutter/src/theme/dark_mode_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeThemeButton extends ConsumerWidget {
  final WidgetRef ref;
  const ChangeThemeButton({
    required this.ref,
    super.key,
  });
  void flipTheme(ThemeMode value) {
    ref.read(darkModeProvider.notifier).toggle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);

    return IconButton(
      icon: Icon(
        darkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      onPressed: () {
        ref.read(darkModeProvider.notifier).toggle();
      },
    );
  }
}
