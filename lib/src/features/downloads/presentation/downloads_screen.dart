import 'package:cms_flutter/src/features/downloads/presentation/lectures_downloads_screen.dart';
import 'package:cms_flutter/src/features/downloads/presentation/slides_downloads_screen.dart';
import 'package:flutter/material.dart';

enum Selection { lectures, slides }

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  Selection selected = Selection.lectures;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Downloads',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = Selection.lectures;
                    });
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Lectures",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                        child: Container(
                          color: selected == Selection.lectures
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
                      selected = Selection.slides;
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
                          color: selected == Selection.slides
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
          Expanded(
            child: IndexedStack(
              index: selected == Selection.lectures ? 0 : 1,
              children: const [
                LecturesDownloadsScreen(),
                SlidesDownloadsScreen(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
