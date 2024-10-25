import 'package:cms_flutter/src/common/primary_button.dart';
import 'package:cms_flutter/src/common/secondary_button.dart';
import 'package:cms_flutter/src/common/video_quality_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

Future<void> selectVideoQualityModal(
    {required BuildContext context,
    required VoidCallback handleDownload}) async {
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
            SvgPicture.asset('assets/svg/download.svg',
                height: 40,
                width: 40,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF64748B),
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'Download'),
            const Text(
              'Download Lecture',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text('Select quality to download lecture'),
            const SizedBox(
              height: 20,
            ),
            const VideoQualityOptions(),
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
                      buttonText: 'Download',
                      onPressed: handleDownload,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      );
    },
  );
}
