import 'package:flutter/material.dart';
import "suwak.dart";

class SymptomsScreen extends StatefulWidget {
  final DateTime date;
  const SymptomsScreen({Key? key, required this.date}) : super(key: key);

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Formatowanie daty do czytelnej postaci
    final String formattedDate = widget.date.toLocal().toString().substring(
      0,
      10,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Objawy — $formattedDate'), centerTitle: true),
      body: Padding(
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
              width: double.infinity,
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Wpisz lek i dawke (w mg)...',
                ),
              ),
            ),

            const SizedBox(height: 4),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final String opis = _controller.text.trim();
                  // Tutaj w przyszłości będziesz zapisywać do bazy danych:
                  // np. DatabaseService.saveSymptoms(date: widget.date, text: opis);
                  Navigator.pop(context, opis);
                },
                child: Text('Zapisz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
