import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedDepartment = '';
  Map<String, bool> attendanceStatus = {
    '👨‍💼 رئيس القسم': true,
    '👨‍💻 موظف 1': false,
    '👩‍💼 موظف 2': true,
  };

  void openDrawer(String department) {
    setState(() {
      selectedDepartment = department;
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      scaffoldKey.currentState?.openEndDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('📍 مساحة الحضور', textDirection: TextDirection.rtl),
        backgroundColor: Colors.teal[600],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '📋 اختر القسم لتطلع للحضور',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),

            // Department List with Styled Cards
            buildDepartmentTile('🏦 قسم المالية'),
            buildDepartmentTile('📢 قسم التسويق'),
            buildDepartmentTile('🏛 قسم الإدارة'),
          ],
        ),
      ),

      // Right-side Drawer
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBar(
              title: Text('📌 قائمة الحضور لـ $selectedDepartment',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.teal[600],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: attendanceStatus.entries.map((entry) {
                  return Card(
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(entry.key,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      trailing: CircleAvatar(
                        backgroundColor:
                            entry.value ? Colors.green : Colors.red[400],
                        radius: 12,
                        child: entry.value
                            ? const Icon(Icons.check,
                                size: 14, color: Colors.white)
                            : const Icon(Icons.close,
                                size: 14, color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDepartmentTile(String department) {
    return GestureDetector(
      onTap: () => openDrawer(department),
      child: Card(
        color: Colors.white,
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(
            department,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
        ),
      ),
    );
  }
}
