// Screen 2
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/CheckboxWithAction.dart';

class OnboardingScreen2 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen2({required this.onNext});

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
              "How did you hear about Vocabulary?",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorsExt.mainText),
            ),
            SizedBox(height: 16),
            Text(
              "Select an option to continue",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 16, color: ColorsExt.secondaryText),
            ),
            SizedBox(height: 32),
            RoundedCheckboxWithAction(
              text: 'TikTok',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Instagram',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Facebook',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'App Store',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Web search',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Friend/family',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Other',
              onChanged: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
