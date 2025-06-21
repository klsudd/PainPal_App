import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Nausea/vomiting', 'Photosensitivity', 'Numbness or tingling of body parts', 'Chills/ sweats', 'Dizziness', 'Speech disorders', 'Aura'];

void main() => runApp(const DropdownMenuApp());

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Select associated symptoms')),
        body: const Center(child: DropdownMenuExample_objaw()),
      ),
    );
  }
}

class DropdownMenuExample_objaw extends StatefulWidget {
  const DropdownMenuExample_objaw({super.key});

  @override
  State<DropdownMenuExample_objaw> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropdownMenuExampleState extends State<DropdownMenuExample_objaw> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}