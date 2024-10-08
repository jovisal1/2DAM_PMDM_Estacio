import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Widgets de navegación',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Widgets de navegación"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    context.push("/bottomNavigationBar");
                  },
                  child: const Text("BottomNavigationBar"),
                ),
                TextButton(
                  onPressed: () {
                    context.push("/drawer");
                  },
                  child: const Text("Drawer"),
                ),
                TextButton(
                  onPressed: () {
                    context.push("/TabView");
                  },
                  child: const Text("TabView"),
                ),
                TextButton(
                  onPressed: () {
                    context.push("/NavigationRail");
                  },
                  child: const Text("NavigationRail"),
                ),
                TextButton(
                  onPressed: () {
                    context.push("/PageView");
                  },
                  child: const Text("PageView"),
                ),
              ],
            ),
          ),
        ));
  }
}
