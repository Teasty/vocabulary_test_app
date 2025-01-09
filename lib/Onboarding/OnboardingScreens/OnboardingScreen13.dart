import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/Checbox.dart';
import 'package:test_app/Onboarding/OnboardingElements/ShinkableButton.dart';

class OnboardingScreen13 extends StatefulWidget {
  final VoidCallback onNext;

  OnboardingScreen13({required this.onNext});

  @override
  _OnboardingScreen12State createState() => _OnboardingScreen12State();
}

class _OnboardingScreen12State extends State<OnboardingScreen13> {
_OnboardingScreen12State();

  // List of items with their states
  final List<Map<String, dynamic>> _items = [
    {'label': 'Sosiety', 'isChecked': false},
    {'label': 'Words in foriegn languages', 'isChecked': false},
    {'label': 'Human body', 'isChecked': false},
    {'label': 'Emotions', 'isChecked': false},
    {'label': 'Buisness', 'isChecked': false},
    {'label': 'Other', 'isChecked': false},
  ];

  // Method to check if any checkbox is selected
  bool _isButtonEnabled() {
    return _items.any((item) => item['isChecked']);
  }

  // Method to handle checkbox toggle
  void _toggleCheckbox(int index, bool? value) {
    setState(() {
      _items[index]['isChecked'] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/6,
            ),
            Text(
              "Which topics are you\ninterested in?",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorsExt.mainText),
            ),
            const SizedBox(height: 16),
            Text(
              "Select at least one option to continue",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 16, color: ColorsExt.secondaryText),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      RoundedCheckboxWithText(
                        text: _items[index]['label'],
                        onChanged: (value) {
                          _toggleCheckbox(index, value);
                        },
                      ),
                      SizedBox(height: 16,)
                    ],
                  );
                },
              ),
            ),
            // Submit button
            ShrinkableButton(
              text: 'Continue',
              onTap: widget.onNext,
              enabled: _isButtonEnabled(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
