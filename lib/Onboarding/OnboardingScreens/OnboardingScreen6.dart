// Screen 6
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/ShinkableButton.dart';

class OnboardingScreen6 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen6({required this.onNext});

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
                      color: ColorsExt.secondaryText
                    ),
                  ))
                ],
              ),
            ),
            Text(
              "What do you want to\nbe called?",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorsExt.mainText),
            ),
            const SizedBox(height: 16),
            Text(
              "Your name is used to personalize\nyour experience",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(fontSize: 16, color: ColorsExt.secondaryText),
            ),
            const SizedBox(height: 32),
            TextField(
              cursorColor: ColorsExt.mainBright,
              obscureText: false,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  hintStyle:
                      TextStyle(fontSize: 14.0, color: ColorsExt.mainBright),
                  fillColor: ColorsExt.mainLight,
                  hoverColor: null,
                  focusColor: null,
                  hintText: 'Your name'),
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
