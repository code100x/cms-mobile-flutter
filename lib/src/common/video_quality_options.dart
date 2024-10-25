import 'package:cms_flutter/src/constants/colors.dart';
import 'package:flutter/material.dart';

enum _DownloadQuality {
  p480(val: '480p'),
  p720(val: '720p'),
  p1080(val: '1080p');

  const _DownloadQuality({required this.val});
  final String val;
}

class VideoQualityOptions extends StatefulWidget {
  const VideoQualityOptions({super.key});

  @override
  State<VideoQualityOptions> createState() => _VideoQualityOptionsState();
}

class _VideoQualityOptionsState extends State<VideoQualityOptions> {
  _DownloadQuality? selectedQuality = _DownloadQuality.p480;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: _DownloadQuality.values.map<Padding>((val) {
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: RadioListTile<_DownloadQuality>(
              shape: OutlineInputBorder(
                borderSide: BorderSide(
                    color: selectedQuality == val
                        ? const Color(0xFF3259E8)
                        : const Color(0xFFE2E8F0)),
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(val.val),
              value: val,
              tileColor:
                  selectedQuality == val ? const Color(0x1A3B82F6) : null,
              groupValue: selectedQuality,
              activeColor: CommonPallet.primaryButtonBG,
              onChanged: (val) {
                setState(() {
                  selectedQuality = val;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
