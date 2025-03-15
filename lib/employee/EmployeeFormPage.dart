import 'package:alfred/employee/AnnouncementPage.dart';
import 'package:alfred/employee/MySpace.dart';
import 'package:flutter/material.dart';

class EmployeeFormPage extends StatefulWidget {
  @override
  _EmployeeFormPageState createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AnnouncementsPage(), // Placeholder for Ad Space Page (مساحة الإعلانات)
    WorkSpacePage(),
    ComplaintsPage(),
    MySpacePage(), // Placeholder for Personal Space Page (مساحتي)
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.campaign), label: 'مساحة الإعلانات'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'مساحة العمل'),
          BottomNavigationBarItem(
              icon: Icon(Icons.feedback), label: 'مساحة الشكاوي'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'مساحتي'),
        ],
      ),
    );
  }
}

class WorkSpacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مساحة العمل'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionCard(
              icon: Icons.how_to_reg,
              title: "تسجيل حضوري",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AttendanceRegistrationPage())),
            ),
            _buildActionCard(
              icon: Icons.monetization_on,
              title: "راتبي",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SalaryDetailsPage())),
            ),
            _buildActionCard(
              icon: Icons.request_page,
              title: "طلب إجازة",
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LeaveRequestPage())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 35),
        title: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

class ComplaintsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مساحة الشكاوي')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildTextField("تحديد القسم"),
            _buildTextField("موضوع الشكوى"),
            _buildTextField("التفاصيل", maxLines: 4),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.visibility_off, color: Colors.white),
                  onPressed: () {},
                  label: const Text('نشر بمجهول الهوية',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700]),
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                  label: const Text('نشر بإظهار الهوية',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

class AttendanceRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل حضوري')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
                Icons.location_on, "تفعيل GPS", Colors.green, () {}),
            _buildActionButton(
                Icons.camera_alt, "أخذ صورة لمكان العمل", Colors.blue, () {}),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'تنويه: تنتهي صلاحية هذا التسجيل عند أول استراحة، لذا يرجى التسجيل مرة ثانية بعد انتهائها.',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, String label, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(label, style: TextStyle(fontSize: 18, color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class SalaryDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('راتبي')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "اختر الشهر",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  items: [
                    DropdownMenuItem(
                        value: 'this_month', child: Text('هذا الشهر'))
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                _buildSalaryInfo("الراتب الكلي", "500000 دج"),
                _buildSalaryInfo("الراتب الصافي", "500000 دج"),
                _buildSalaryInfo("الزيادات", "0 دج"),
                _buildSalaryInfo("اقتطاع التأمين", "200000 دج سنوياً"),
                _buildSalaryInfo("اقتطاع الضمان الاجتماعي", "12000 دج"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSalaryInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
        ],
      ),
    );
  }
}

class LeaveRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلب إجازة')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("سبب الإجازة"),
            _buildDateField(context, "تاريخ البدء"),
            _buildDateField(context, "تاريخ الانتهاء"),
            _buildTextField("ملاحظات إضافية", maxLines: 3),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                label: const Text('إرسال الطلب',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  // Handle submission logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: Icon(Icons.calendar_today, color: Colors.blue),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          // Handle selected date
        },
      ),
    );
  }
}
