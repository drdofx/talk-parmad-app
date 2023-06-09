import 'package:flutter/material.dart';
import 'package:talk_parmad/screens/forum_list_page.dart';
import 'package:talk_parmad/screens/home_page.dart';
import 'package:talk_parmad/screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    const Center(
        child: Text('Forum Discovery')), // Updated text for the second item
    const Center(
        child: Text('Create Forum')), // Updated text for the third item
    ForumListPage(), // Updated text for the fourth item
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talk Parmad',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFCBE0FF)),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color(0xFFCBE0FF),
          title:
              const Text('Talk Parmad', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 4; // Profile
                });
              },
              icon: const Icon(Icons.person),
            ),
          ],
          elevation: 0.0,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFCBE0FF),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 36.0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore,
                  size: 36.0), // Updated icon for the second item
              label: 'Forum Discovery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add,
                  size: 36.0), // Updated icon for the third item
              label: 'Create Forum',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted,
                  size: 36.0), // Updated icon for the fourth item
              label: 'Forum List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 36.0),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF70A6F5),
          unselectedItemColor: const Color(0xFFFFFFFF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
