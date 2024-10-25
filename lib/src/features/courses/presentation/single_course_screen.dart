import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SingleCourseScreen extends StatefulWidget {
  const SingleCourseScreen({super.key});

  @override
  State<SingleCourseScreen> createState() => _SingleCourseScreenState();
}

class _SingleCourseScreenState extends State<SingleCourseScreen> {
  bool show = false;

  void _setShowToTrue() {
    Future.delayed(const Duration(seconds: 1)).then((onValue) {
      if (mounted) {
        setState(() {
          show = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setShowToTrue();
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
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cohort 3.0 | Web Dev',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: _getBookMarks(show)),
          ],
        ),
      )),
    );
  }

  Widget _getBookMarks(bool show) {
    final colorScheme = Theme.of(context).colorScheme;
    final listItems = List.generate(10, (index) => index);
    if (show) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              height: 100,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: colorScheme.tertiary,
                    border: Border.all(color: colorScheme.outline),
                    borderRadius: BorderRadius.circular(15)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.go('/courses/1/1');
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: colorScheme.outline),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(
                                Icons.folder_outlined,
                                color: Color.fromARGB(255, 103, 106, 110),
                              ),
                            ),
                          ),
                        ),
                        title: const Text('HTML Introduction'),
                        subtitle: const Text('Posted on: 10 Aug 24'),
                        trailing: const Icon(
                          Icons.check_circle_outline_outlined,
                          color: Color(0xFF00823E),
                          size: 26,
                        ),
                      ),
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
              'Course Not Started Yet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 320,
                child: Text(
                  'This course hasn\'t begun yet. You\'ll be able to access lectures and slides once it does.',
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      );
    }
  }
}
