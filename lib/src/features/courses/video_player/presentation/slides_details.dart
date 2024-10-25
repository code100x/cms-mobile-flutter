import 'package:flutter/material.dart';

class SlidesDetails extends StatefulWidget {
  const SlidesDetails({super.key});

  @override
  State<SlidesDetails> createState() => _SlidesDetailsState();
}

class _SlidesDetailsState extends State<SlidesDetails> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                color: colorScheme.tertiary,
                border: Border.all(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(15)),
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
                        Icons.insert_drive_file_outlined,
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
                  icon: const Icon(Icons.download_outlined),
                  color: Colors.grey,
                  iconSize: 26,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
