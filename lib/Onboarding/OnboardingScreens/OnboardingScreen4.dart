// Screen 4
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/CheckboxWithAction.dart';

class OnboardingScreen4 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen4({required this.onNext});

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
              "How old are you?",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 28, fontWeight: FontWeight.bold, color: ColorsExt.mainText),
            ),
            SizedBox(height: 16),
            Text(
              "Your age is used to personalize your content",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 16, color: ColorsExt.secondaryText),
            ),
            SizedBox(height: 32),
            RoundedCheckboxWithAction(
              text: '13 to 17',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '18 to 24',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '25 to 34',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '35 to 44',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '45 to 54',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '55+',
              onChanged: onNext,
            ),
          ],
        ),
      ),
    );
  }
}