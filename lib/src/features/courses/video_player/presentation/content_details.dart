import 'package:flutter/material.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  Wrap expandedValue;
  ListTile headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
        isExpanded: index == 0 ? true : false,
        headerValue: ListTile(
          textColor: index == 0 ? const Color(0xFF3259E8) : null,
          title: const Text(
            "Week 1",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('0/4 Lectures'),
        ),
        expandedValue: Wrap(children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "Introduction to HTML",
                style: TextStyle(
                  color: index == 0 ? const Color(0xFF3259E8) : null,
                ),
              ),
              const Spacer(),
              Checkbox(value: true, onChanged: (val) {}),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_border_outlined))
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("HTML advanced"),
              const Spacer(),
              Checkbox(value: true, onChanged: (val) {}),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_border_outlined))
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("CSS"),
              const Spacer(),
              Checkbox(value: false, onChanged: (val) {}),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_border_outlined))
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("JS"),
              const Spacer(),
              Checkbox(value: false, onChanged: (val) {}),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_border_outlined))
            ],
          ),
        ]));
  });
}

class ContentDetails extends StatefulWidget {
  const ContentDetails({super.key});

  @override
  State<ContentDetails> createState() => _ContentDetailsState();
}

class _ContentDetailsState extends State<ContentDetails> {
  final List<Item> _data = generateItems(2);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: ExpansionPanelList(
        elevation: 1,
        materialGapSize: 0,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            backgroundColor:
                item.isExpanded ? const Color(0xFFEFF1F3) : Colors.white,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return item.headerValue;
            },
            body: item.expandedValue,
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
