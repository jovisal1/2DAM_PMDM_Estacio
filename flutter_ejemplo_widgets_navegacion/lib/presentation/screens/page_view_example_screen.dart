import 'package:flutter/material.dart';

class PageViewExampleScreen extends StatefulWidget {
  const PageViewExampleScreen({super.key});

  @override
  State<PageViewExampleScreen> createState() =>
      _PageViewWithControllerExampleState();
}

class _PageViewWithControllerExampleState extends State<PageViewExampleScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView con Controller')),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
                debugPrint("Estamos en la página $_currentPage");
              },
              children: <Widget>[
                Container(
                    color: Colors.red,
                    child: const Center(child: Text('Página 1'))),
                Container(
                    color: Colors.green,
                    child: const Center(child: Text('Página 2'))),
                Container(
                    color: Colors.blue,
                    child: const Center(child: Text('Página 3'))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text('Anterior'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text('Siguiente'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
