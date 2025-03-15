import 'package:alfred/Head%20dep/AnnouncementPage.dart';
import 'package:alfred/Head%20dep/AttendancePage.dart';
import 'package:alfred/Head%20dep/MySpace.dart';
import 'package:alfred/head%20dep/complaints_page.dart';
import 'package:flutter/material.dart';

class HeadDepFormPage extends StatefulWidget {
  const HeadDepFormPage({super.key});

  @override
  _HeadDepFormPageState createState() => _HeadDepFormPageState();
}

class _HeadDepFormPageState extends State<HeadDepFormPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AnnouncementsPage(),
    AttendancePage(),
    ComplaintsPage(),
    MySpacePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.campaign), label: 'مساحة الإعلانات'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'قائمة الحضور'),
          BottomNavigationBarItem(
              icon: Icon(Icons.report), label: 'مساحة الشكاوي'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'مساحتي'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}

// مساحة الإعلانات (Same as Owner's Page)
