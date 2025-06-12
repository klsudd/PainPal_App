import 'package:flutter/material.dart';
import 'calendar_screen.dart';
import 'symptoms_screen.dart'; // lub inne ekrany dla kolejnych zakładek

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Lista ekranów odpowiadających kolejnym zakładkom
  final List<Widget> _pages = [
    CalendarScreen(),
    // Na razie wstawiamy placeholdery – później podmienisz na właściwe ekrany
    Center(child: Text('Biomet', style: TextStyle(fontSize: 24))),
    Center(child: Text('Statistics', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PainPal'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 0, 98),
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 54, 120, 244),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_cloudy_outlined),
            label: 'Biomet',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.align_vertical_bottom),
            label: 'Statistics',
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}