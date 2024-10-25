import 'package:cms_flutter/src/common/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> purchaseNeededModal(
    {required BuildContext context, required VoidCallback handleDelete}) async {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    isDismissible: true,
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
            SvgPicture.asset('assets/svg/alert_triangle.svg',
                height: 40,
                width: 40,
                colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'Alert Triangle'),
            const Text(
              'Purchase Required',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text('You haven\'t purchased the course yet.'),
            const Text('Visit our website to explore and buy one.'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: PrimaryButton(
                buttonText: 'Visit 100xDevs',
                onPressed: handleDelete,
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
