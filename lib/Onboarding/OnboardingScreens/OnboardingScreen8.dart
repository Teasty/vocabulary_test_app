import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/CheckboxWithAction.dart';

class OnboardingScreen8 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen8({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                children: [
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        onNext();
                      },
                      child: Text(
                        'Skip',
                        style: GoogleFonts.ebGaramond(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              ),
            ),
            Text(
              "How many days in a row\nwill you learn words?",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorsExt.mainText),
            ),
            SizedBox(height: 16),
            Text(
              "Commit to building a learning habit by\ncoming back every day",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 16, color: ColorsExt.secondaryText),
            ),
            SizedBox(height: 32),
            RoundedCheckboxWithAction(
              text: '3 days',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '7 days',
              onChanged: onNext,
            ),
            SizedBox(height: 16),
            RoundedCheckboxWithAction(
              text: '21 days',
              onChanged: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
