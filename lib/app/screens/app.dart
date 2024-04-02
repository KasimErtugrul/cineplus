import 'package:cineplus/app/screens/my_home_page.dart';
import 'package:flutter/material.dart';

class CinePlus extends StatefulWidget {
  const CinePlus({super.key});

  @override
  _CinePlusState createState() => _CinePlusState();
}

class _CinePlusState extends State<CinePlus> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const MyHomePage(),
    const Text('Arama'),
    const Text('Profil'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_sharp),
            label: 'Filmler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Diziler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
