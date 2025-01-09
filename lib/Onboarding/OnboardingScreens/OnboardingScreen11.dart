import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/ShinkableButton.dart';

class OnboardingScreen11 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen11({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/6,
            ),
            Text(
              "Setup Vocabulary to get\npersonalized words",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorsExt.mainText),
            ),
            const SizedBox(height: 16),
            Text(
              "Some final questions to customize\nVocabulary to what you want to achive",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 16, color: ColorsExt.secondaryText),
            ),
            Spacer(),
            ShrinkableButton(
              text: 'Continue',
              onTap: onNext,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}