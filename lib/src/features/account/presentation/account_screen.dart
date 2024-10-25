import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:cms_flutter/src/common/secondary_button.dart';
import 'package:cms_flutter/src/theme/dark_mode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var darkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "My Account",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Switch(
                  value: darkMode,
                  onChanged: (val) {
                    ref.read(darkModeProvider.notifier).toggle();
                  },
                ),
                const Text('Dark Mode'),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'JD',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64748B)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('johndoe@gmail.com'),
            const SizedBox(
              height: 20,
            ),
            _accountActionButton(
              icon: const Icon(Icons.person_outlined),
              color: Colors.black,
              onTap: () {
                context.go('/account/profile');
              },
              text: 'Edit Profile',
            ),
            _accountActionButton(
              icon: const Icon(Icons.lock_outlined),
              color: Colors.black,
              onTap: () {
                context.go('/account/change-password');
              },
              text: 'Change Password',
            ),
            _accountActionButton(
              icon: const Icon(Icons.info_outlined),
              color: Colors.black,
              onTap: () {
                // TODO: Navigate to terms and conditions
              },
              text: 'Terms & Conditions',
            ),
            _accountActionButton(
              icon: const Icon(Icons.shield_outlined),
              color: Colors.black,
              onTap: () {
                // TODO: Navigate to terms and conditions
              },
              text: 'Privacy Policy',
            ),
            _accountActionButton(
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                ),
                color: Colors.red,
                onTap: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    isDismissible: true,
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(
                              Icons.logout_outlined,
                              color: Colors.red,
                              size: 40,
                            ),
                            const Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            const Text('Are you Sure?'),
                            const SizedBox(
                              height: 20,
                            ),
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: SecondaryButton(
                                        buttonText: 'Cancel',
                                        onPressed: () {
                                          context.pop();
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: PrimaryButton(
                                      buttonText: 'Logout',
                                      onPressed: () {
                                        context.go('/landing');
                                      },
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                text: 'Logout'),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _accountActionButton({
    required VoidCallback onTap,
    required Color color,
    required String text,
    required Icon icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFE2E8F0),
              borderRadius: BorderRadius.circular(10)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  icon,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: color),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                    color: color,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
