import 'package:flutter/material.dart';
import "suwak.dart";
import "typ_bolu.dart";
import "przyczyny_bolu_lista.dart";
import "czas_trwania_kropeczki.dart";

class SymptomsScreen extends StatefulWidget {
  final DateTime date;
  const SymptomsScreen({Key? key, required this.date}) : super(key: key);

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  double _painLevel = 0;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = widget.date.toLocal().toString().substring(0, 10);

    return Scaffold(
      appBar: AppBar(title: Text('Objawy — $formattedDate'), centerTitle: true),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Przyjety lek wraz z dawka (w mg):',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: _controller,
                  maxLines: 5,
                  //expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Wpisz lek i dawke (w mg)...',
                  ),
                ),
              ),
              PainIntensitySlider(
                onChanged: (value) {
                  _painLevel = value;
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Wybierz typ bólu:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const DropdownMenuExample_typ(),
              const SizedBox(height: 16),
              Text(
                'Wybierz przyczyny bólu:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const DropdownMenuExample(),
              const SizedBox(height: 16),
              Text(
                'Wybierz czas trwania bólu:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const RadioListTileExample(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final String opis = _controller.text.trim();
                    Navigator.pop(context, opis);
                  },
                  child: Text('Zapisz'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
