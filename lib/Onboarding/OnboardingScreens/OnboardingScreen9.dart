import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/CheckboxWithAction.dart';

class OnboardingScreen9 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen9({required this.onNext});

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
              "How much time will you\ndevote to learning?",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorsExt.mainText),
            ),
            SizedBox(height: 16),
            Text(
              "You can always change your goal later",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 16, color: ColorsExt.secondaryText),
            ),
            SizedBox(height: 32),
            RoundedCheckboxWithAction(
              text: '1 minute a day',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '3 minutes a day',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '5 minutes a day',
              onChanged: onNext,
            ),
          ],
        ),
      ),
    );
  }
}