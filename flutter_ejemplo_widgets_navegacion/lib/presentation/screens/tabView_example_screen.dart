import 'package:flutter/material.dart';

class TabviewExampleScreen extends StatefulWidget {
  const TabviewExampleScreen({super.key});

  @override
  State<TabviewExampleScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TabviewExampleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Home', icon: Icon(Icons.home)),
            Tab(text: 'Profile', icon: Icon(Icons.person)),
            Tab(text: 'Settings', icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Home Content')),
          Center(child: Text('Profile Content')),
          Center(child: Text('Settings Content')),
        ],
      ),
    );
  }
}
