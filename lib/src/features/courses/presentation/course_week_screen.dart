import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseWeekScreen extends StatefulWidget {
  const CourseWeekScreen({super.key});

  @override
  State<CourseWeekScreen> createState() => _CourseWeekScreenState();
}

class _CourseWeekScreenState extends State<CourseWeekScreen> {
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
            Expanded(child: _getBookMarks()),
          ],
        ),
      )),
    );
  }

  Widget _getBookMarks() {
    final listItems = List.generate(10, (index) => index);

    return ListView.separated(
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            height: 100,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  border: Border.all(
                      color: const Color.fromARGB(255, 210, 214, 220)),
                  borderRadius: BorderRadius.circular(15)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.go('/courses/1/1/1');
                  },
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
                              Icons.play_circle_outline_outlined,
                              color: Color.fromARGB(255, 103, 106, 110),
                            ),
                          ),
                        ),
                      ),
                      title: const Text('HTML Introduction'),
                      subtitle: const Text('Posted on: 10 Aug 24'),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFF00823E),
                            size: 26,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: Color.fromARGB(255, 103, 106, 110),
                            size: 26,
                          ),
                        ],
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
  }
}
