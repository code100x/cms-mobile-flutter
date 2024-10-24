import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool show = false;

  void _setShowToTrue() {
    Future.delayed(const Duration(seconds: 1)).then((val) {
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
        leadingWidth: 300,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Watch History',
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
    final List<ListItem> listItems = List.generate(
        20,
        (index) => index % 4 == 0
            ? HeadingItem('Heading $index')
            : VideoItem('Sender $index', 'Message body $index'));
    if (show) {
      return ListView.separated(
          itemBuilder: (context, index) {
            final item = listItems[index];
            if (item is HeadingItem) {
              return const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Today",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
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
                        // TODO: Implement delete bookmark
                      },
                      icon: const Icon(Icons.check_circle_rounded),
                      color: const Color(0xFF00823E),
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
              Icons.history_outlined,
              size: 32,
            ),
            Text(
              'No Watch History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Looks like you haven\'t watched any videos yet.'),
            SizedBox(
              width: 350,
              child: Text(
                'Start learning now to see your recently watched content here.',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class VideoItem implements ListItem {
  final String sender;
  final String body;

  VideoItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
