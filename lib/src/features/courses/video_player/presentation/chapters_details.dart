import 'package:flutter/material.dart';

class ChaptersDetails extends StatefulWidget {
  const ChaptersDetails({super.key});

  @override
  State<ChaptersDetails> createState() => _ChaptersDetailsState();
}

class _ChaptersDetailsState extends State<ChaptersDetails> {
  final items = [
    "Welcome to 100xDevs",
    "History of Web Dev",
    "Early Technologies",
    "Basics of Devops",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, i) {
          return SizedBox(
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 233, 236),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text('${i + 1}. ${items[i]}'),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0x443B82F6),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                        child: Text(
                          '00:00:00',
                          style: TextStyle(color: Color(0xFF3259E8)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, i) => const SizedBox(
              height: 10,
            ),
        itemCount: items.length);
  }
}
