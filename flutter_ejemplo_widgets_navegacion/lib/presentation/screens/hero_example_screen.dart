import 'package:flutter/material.dart';

class HeroExampleScreen extends StatelessWidget {
  const HeroExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DetailScreen();
            }));
          },
          child: Center(
            child: ListTile(
              title: const Text('El mejor equipo del mundo'),
              leading: Hero(
                tag: 'imageHero',
                child: Image.asset(
                  'assets/images/Valenciacf.png',
                  width: 200,
                ),
              ),
            ),
          )),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: Hero(
          tag: 'imageHero',
          child: Image.asset(
            'assets/images/Valenciacf.png',
          ),
        )),
      ),
    );
  }
}
