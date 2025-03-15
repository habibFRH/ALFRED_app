import 'package:flutter/material.dart';

class CitizenFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("مساعدة المواطن", textAlign: TextAlign.right),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.end, // Align content to the right
          children: [
            Text(
              "مرحبا أيها المواطن، يمكننا مساعدتك بـ:",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
              textAlign: TextAlign.right, // Text right-aligned
            ),
            SizedBox(height: 40),
            _buildActionButton(
              Icons.work,
              "طلب الحصول على تربص / وظيفه",
              Colors.green,
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => JobRequestPage())),
            ),
            SizedBox(height: 20),
            _buildActionButton(
              Icons.feedback,
              "تقديم اقتراح/ شكوى",
              Colors.orange,
              () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ComplaintSuggestionPage())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, String label, Color color, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerRight, // Align button to the right
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class JobRequestPage extends StatelessWidget {
  final List<String> wilayas = ["Constantine", "Alger", "Oran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلب وظيفة", textAlign: TextAlign.right),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.end, // Align content to the right
          children: [
            _buildDropdown("تحديد الولاية", wilayas),
            SizedBox(height: 10),
            _buildCardField("اختيار المؤسسة"),
            Align(
              alignment: Alignment.centerRight,
              child: Text("توجد المؤسسات المسجلة عندنا فقط",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.right),
            ),
            _buildCardField("نوع الوظيفة المناسبة"),
            _buildCardField("السيرة الذاتية"),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("تأكيد و إرسال", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
      children: [
        Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.right),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonFormField<String>(
            isExpanded: true, // Ensure dropdown expands properly in RTL
            decoration: InputDecoration(border: InputBorder.none),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, textAlign: TextAlign.right),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _buildCardField(String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextField(
            textAlign: TextAlign.right, // Align input text to the right
            decoration: InputDecoration(
              labelText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class ComplaintSuggestionPage extends StatelessWidget {
  final List<String> wilayas = ["Constantine", "Alger", "Oran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تقديم اقتراح/ شكوى", textAlign: TextAlign.right),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.end, // Align content to the right
          children: [
            _buildDropdown("تحديد الولاية", wilayas),
            SizedBox(height: 10),
            _buildCardField("اختيار المؤسسة"),
            Align(
              alignment: Alignment.centerRight,
              child: Text("توجد المؤسسات المسجلة عندنا فقط",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.right),
            ),
            _buildCardField("شكوى / اقتراح..."),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("إرسال", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
      children: [
        Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.right),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(border: InputBorder.none),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, textAlign: TextAlign.right),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _buildCardField(String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              labelText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
