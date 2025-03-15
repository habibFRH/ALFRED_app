// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class StressAssessmentPage extends StatefulWidget {
  const StressAssessmentPage({super.key});

  @override
  _StressAssessmentPageState createState() => _StressAssessmentPageState();
}

class _StressAssessmentPageState extends State<StressAssessmentPage> {
  final TextEditingController _testController = TextEditingController();
  DateTime? _selectedDate;

  // Function to pick a date and time
  Future<void> _pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧘‍♂️ تقييم الاجهاد النفسي'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Title: "تقييم الاجهاد النفسي"
            const Text(
              '🧠 تقييم الاجهاد النفسي',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Input: "اخذ الاختبار للتقييم"
            TextField(
              controller: _testController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '✍️ اكتب إجابتك هنا...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),

            // Title: "حجز موعد الاستشاره النفسيه"
            const Text(
              '📅 حجز موعد الاستشارة النفسية',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Date Picker: "تحديد اليوم والوقت المناسب"
            InkWell(
              onTap: _pickDateTime,
              child: InputDecorator(
                decoration: InputDecoration(
                  hintText: '📆 تحديد اليوم والوقت المناسب',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _selectedDate == null
                      ? '📆 تحديد اليوم والوقت المناسب'
                      : DateFormat('yyyy-MM-dd – HH:mm').format(_selectedDate!),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Info Text
            const Text(
              '* سيتواصل معك فريقنا في أقرب وقت',
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
            const SizedBox(height: 20),

            // Confirmation Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle confirmation logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم تأكيد الموعد بنجاح!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  '✅ تأكيد',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
