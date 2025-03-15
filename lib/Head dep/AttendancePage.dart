import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  final List<Map<String, dynamic>> employees = [
    {'name': 'محمد أحمد', 'attending': true},
    {'name': 'سعاد خالد', 'attending': false},
    {'name': 'علي حسن', 'attending': true},
    {'name': 'فاطمة يوسف', 'attending': false},
  ];

  void _showEmployeeDetails(
      BuildContext context, Map<String, dynamic> employee) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Column(
            children: [
              const Icon(Icons.person, size: 40, color: Colors.blue),
              const SizedBox(height: 8),
              Text(
                employee['name'],
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.access_time, color: Colors.blue),
                  SizedBox(width: 5),
                  Text(
                    'توقيت العمل: 9:00 AM - 5:00 PM',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'طلب الإجازة',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('رفض',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('قبول',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'قائمة الحضور',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: Icon(
                Icons.circle,
                color:
                    employee['attending'] ? Colors.green : Colors.grey.shade400,
                size: 16,
              ),
              title: Text(
                employee['name'],
                textAlign: TextAlign.right,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.info_outline, color: Colors.blue),
              onTap: () => _showEmployeeDetails(context, employee),
            ),
          );
        },
      ),
    );
  }
}
