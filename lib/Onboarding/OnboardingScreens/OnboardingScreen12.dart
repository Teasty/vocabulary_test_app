import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/Checbox.dart';
import 'package:test_app/Onboarding/OnboardingElements/ShinkableButton.dart';

class OnboardingScreen12 extends StatefulWidget {
  final VoidCallback onNext;

  OnboardingScreen12({required this.onNext});

  @override
  _OnboardingScreen12State createState() => _OnboardingScreen12State();
}

class _OnboardingScreen12State extends State<OnboardingScreen12> {

  // List of items with their states
  final List<Map<String, dynamic>> _items = [
    {'label': 'Enhance my lexicon', 'isChecked': false},
    {'label': 'Get ready for a test', 'isChecked': false},
    {'label': 'Improve my job prospects', 'isChecked': false},
    {'label': 'Enjpy learning new words', 'isChecked': false},
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
              "Do you have a spacific\ngoal for 2025",
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
