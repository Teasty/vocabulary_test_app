// Screen 5
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/CheckboxWithAction.dart';

class OnboardingScreen5 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen5({required this.onNext});

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
              "Which option represents you best?",
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
              text: 'Female',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Male',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Other',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: 'Prefer not to say',
              onChanged: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
