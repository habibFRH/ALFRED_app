import 'package:alfred/Head%20dep/HeadDepFormPage.dart';
import 'package:alfred/citizen/CitizenFormPage.dart';
import 'package:alfred/employee/EmployeeFormPage.dart';
import 'package:alfred/owner/owner_form_page.dart';
import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;
  String? _selectedRole;

  void _navigateToRolePage() {
    switch (_selectedRole) {
      case 'صاحب المؤسسة':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OwnerFormPage()),
        );
        break;
      case 'رئيس قسم':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HeadDepFormPage()),
        );
        break;
      case 'موظف':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EmployeeFormPage()),
        );
        break;
      case 'مواطن':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CitizenFormPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  child: Image.asset(
                    'assets/logo.jpeg',
                    width: 100, // Adjust as needed
                    height: 100,
                    fit: BoxFit
                        .cover, // Ensures the image fills the area properly
                  ),
                ),
              ),
              Expanded(
                child: Stepper(
                  currentStep: _currentStep,
                  onStepContinue: () {
                    if (_currentStep < 1) {
                      if (_selectedRole != null) {
                        setState(() => _currentStep += 1);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('يرجى اختيار نوع المستخدم')),
                        );
                      }
                    } else {
                      _navigateToRolePage();
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() => _currentStep -= 1);
                    }
                  },
                  controlsBuilder: (context, details) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentStep > 0)
                          ElevatedButton(
                            onPressed: details.onStepCancel,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('رجوع'),
                          ),
                        ElevatedButton(
                          onPressed: details.onStepContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                              _currentStep == 1 ? 'تسجيل الدخول' : 'التالي'),
                        ),
                      ],
                    );
                  },
                  steps: [
                    Step(
                      title: const Text('اختر نوعك',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          textDirection: TextDirection.rtl),
                      content: _buildRoleSelection(),
                      isActive: _currentStep >= 0,
                    ),
                    Step(
                      title: const Text('تسجيل الدخول',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          textDirection: TextDirection.rtl),
                      content: _buildLoginForm(),
                      isActive: _currentStep >= 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleSelection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (var role in ['صاحب المؤسسة', 'رئيس قسم', 'موظف', 'مواطن'])
              RadioListTile<String>(
                title: Text(role,
                    style: const TextStyle(fontSize: 18),
                    textDirection: TextDirection.rtl),
                value: role,
                groupValue: _selectedRole,
                onChanged: (value) => setState(() => _selectedRole = value),
                activeColor: Colors.blueAccent,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField('اسم المستخدم'),
            const SizedBox(height: 16),
            _buildTextField('كلمة المرور', obscureText: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
