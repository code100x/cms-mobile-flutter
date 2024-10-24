import 'package:cms_flutter/src/common/confirm_delete_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LecturesDownloadsScreen extends StatefulWidget {
  const LecturesDownloadsScreen({super.key});

  @override
  State<LecturesDownloadsScreen> createState() =>
      _LecturesDownloadsScreenState();
}

class _LecturesDownloadsScreenState extends State<LecturesDownloadsScreen> {
  bool show = false;

  void _setShowToTrue() {
    Future.delayed(const Duration(seconds: 1)).then((onValue) {
      setState(() {
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _setShowToTrue();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
          child: SizedBox(
              child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE2E8F0)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Color(0xFF64748B),
                  ),
                  hintText: 'Search Lectures ...',
                  hintStyle: TextStyle(color: Color(0xFF64748B)),
                  border: InputBorder.none,
                ),
              ),
            ),
          )),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: _getDownloadedLectures(show),
          ),
        ),
      ],
    );
  }

  Widget _getDownloadedLectures(bool show) {
    final listItems = List.generate(10, (index) => index);
    if (show) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    border: Border.all(
                        color: const Color.fromARGB(255, 210, 214, 220)),
                    borderRadius: BorderRadius.circular(15)),
                child: Align(
                  alignment: Alignment.center,
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 164, 168, 174)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_outlined,
                            color: Color.fromARGB(255, 103, 106, 110),
                          ),
                        ),
                      ),
                    ),
                    title: const Text('HTML Introduction'),
                    subtitle: const Text('Posted on: 10 Aug 24'),
                    trailing: IconButton(
                      onPressed: () {
                        confirmDeleteModal(
                            context: context,
                            handleDelete: () {
                              // TODO: Handle delete properly
                              context.pop();
                            });
                      },
                      icon: const Icon(Icons.delete_forever_outlined),
                      color: Colors.red,
                      iconSize: 26,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: listItems.length);
    } else {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.bookmark_outline_sharp,
              size: 32,
            ),
            Text(
              'No Lecture Downloads',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('You haven\'t downloaded any lectures yet.'),
            Text('Download now to watch offline at your convenience.')
          ],
        ),
      );
    }
  }
}
