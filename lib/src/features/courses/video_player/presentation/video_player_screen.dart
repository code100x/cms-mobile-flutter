import 'package:cms_flutter/src/features/courses/video_player/presentation/chapters_details.dart';
import 'package:cms_flutter/src/features/courses/video_player/presentation/content_details.dart';
import 'package:cms_flutter/src/features/courses/video_player/presentation/slides_details.dart';
import 'package:cms_flutter/src/features/courses/video_player/presentation/video_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum _Selection { content, chapters, slides }

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  _Selection selected = _Selection.content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_back_ios_new_outlined),
              Text("Back")
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: VideoPlayer()),
            ),
            Row(
              children: [
                const Text(
                  'Introduction to HTML',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      // TODO: Launch Modal to ask for which quality to download.
                    },
                    icon: const Icon(Icons.download_outlined))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = _Selection.content;
                      });
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Content",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                          child: Container(
                            color: selected == _Selection.content
                                ? const Color(0xFF3B58E0)
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = _Selection.chapters;
                      });
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Chapters",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                          child: Container(
                            color: selected == _Selection.chapters
                                ? const Color(0xFF3B58E0)
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = _Selection.slides;
                      });
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Slides",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                          child: Container(
                            color: selected == _Selection.slides
                                ? const Color(0xFF3B58E0)
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: IndexedStack(
                index: selected == _Selection.content
                    ? 0
                    : selected == _Selection.chapters
                        ? 1
                        : 2,
                children: const [
                  ContentDetails(),
                  ChaptersDetails(),
                  SlidesDetails(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
