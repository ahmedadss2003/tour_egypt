import 'package:flutter/material.dart';

class SuggestionView extends StatefulWidget {
  const SuggestionView({super.key});

  @override
  State<SuggestionView> createState() => _SuggestionViewState();
}

class _SuggestionViewState extends State<SuggestionView> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'المفضلة',
      style: optionStyle,
    ),
    Text(
      'المدن',
      style: optionStyle,
    ),
    Text(
      'الفعاليات',
      style: optionStyle,
    ),
    Text(
      'المزيد',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestion View'), // Replace with your desired title
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'المدن',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'الفعاليات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'المزيد',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }
}