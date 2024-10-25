import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:cms_flutter/src/common/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> confirmDeleteModal(
    {required BuildContext context, required VoidCallback handleDelete}) async {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    isDismissible: true,
    backgroundColor: Theme.of(context).colorScheme.tertiary,
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
              'Confirm Deletion',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text('Are you Sure?, This action can\'t be undone.'),
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
                      buttonText: 'Delete',
                      onPressed: handleDelete,
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
}
