import 'package:flutter/material.dart';

void main() => runApp(const RadioListTileApp());

class RadioListTileApp extends StatelessWidget {
  const RadioListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RadioListTile Sample')),
        body: const RadioListTileExample_res(),
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson, hamilton }

class RadioListTileExample_res extends StatefulWidget {
  const RadioListTileExample_res({super.key});

  @override
  State<RadioListTileExample_res> createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample_res> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Text('Cessation of pain within 2h'),
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Pain reduction'),
          value: SingingCharacter.jefferson,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Reducing the annoyance of commodity symptoms'),
          value: SingingCharacter.hamilton,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}