import 'package:flutter/material.dart';

class BottomNavigationBarExampleScreen extends StatefulWidget {
  const BottomNavigationBarExampleScreen({super.key});

  @override
  State<BottomNavigationBarExampleScreen> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExampleScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Navigation Example')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // El índice de la pestaña seleccionada
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Cambia la pestaña seleccionada
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
