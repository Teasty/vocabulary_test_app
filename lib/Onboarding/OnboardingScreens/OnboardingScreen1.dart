// Screen 1
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Onboarding/OnboardingElements/ShinkableButton.dart';

class OnboardingScreen1 extends StatelessWidget {
  final VoidCallback onNext;

  OnboardingScreen1({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text(
              "Expand your Vocabulary\nin 1 minut a day",
              textAlign: TextAlign.center,
              style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorsExt.mainText),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "With the Vocabulary app, you can:\n\n- Learn new words with minimal time investment, simply scrolling through your phone\n- Choose your own level of difficulty, based on your current English language mastery\n- Select Vocabulary categories that best suit your needs and interests\n- Speak and write more concisely and confidently, with the right word at your fingertips\n- Meet your linguistic goals at your own pace\n- Customize the app’s features and make it work for you",
                textAlign: TextAlign.left,
                style: GoogleFonts.ebGaramond(
                    fontSize: 16, color: ColorsExt.secondaryText),
              ),
            ),
            Spacer(),
            ShrinkableButton(
              text: 'Get started',
              onTap: onNext,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
