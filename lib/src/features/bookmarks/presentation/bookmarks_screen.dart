import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cms_flutter/src/common/confirm_delete_modal.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
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
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Bookmarks',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: _getBookMarks(show),
      )),
    );
  }

  Widget _getBookMarks(bool show) {
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
              'No Bookmarks yet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('You haven\'t bookmarked any videos yet.'),
            Text('Start saving your favourite lectures for easy access later.')
          ],
        ),
      );
    }
  }
}
