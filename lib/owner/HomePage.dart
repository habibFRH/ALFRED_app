import 'package:alfred/owner/complaints_page.dart';
import 'package:flutter/material.dart';
import 'package:alfred/owner/AnnouncementsPage.dart';
import 'package:alfred/owner/AttendancePage.dart';
import 'package:alfred/owner/MySpacePage.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AnnouncementsPage(),
    const AttendancePage(),
    const ComplaintsPage(),
    const MySpacePage(), // ✅ Now using MySpacePage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.campaign), label: 'مساحة الإعلانات'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'مساحة الحضور'),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning), label: 'مساحة الشكاوي'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'مساحتي'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
