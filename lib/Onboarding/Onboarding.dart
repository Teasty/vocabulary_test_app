import 'package:flutter/material.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen1.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen10.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen11.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen12.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen13.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen2.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen3.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen4.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen5.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen6.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen7.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen8.dart';
import 'package:test_app/Onboarding/OnboardingScreens/OnboardingScreen9.dart';
import 'package:test_app/main.dart';

import '../Constants/SharedPrefs.dart';

class OnboardingScreens extends StatefulWidget {
  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage(int currentIndex) {
    if (currentIndex < 12) {
      _pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView(
          controller: _pageController,
          physics:
              const NeverScrollableScrollPhysics(), // Disable swipe to enforce button navigation
          children: [
            OnboardingScreen1(onNext: () => _goToNextPage(0)),
            OnboardingScreen2(onNext: () => _goToNextPage(1)),
            OnboardingScreen3(onNext: () => _goToNextPage(2)),
            OnboardingScreen4(onNext: () => _goToNextPage(3)),
            OnboardingScreen5(onNext: () => _goToNextPage(4)),
            OnboardingScreen6(onNext: () => _goToNextPage(5)),
            OnboardingScreen7(onNext: () => _goToNextPage(6)),
            OnboardingScreen8(onNext: () => _goToNextPage(7)),
            OnboardingScreen9(onNext: () => _goToNextPage(8)),
            OnboardingScreen10(onNext: () => _goToNextPage(9)),
            OnboardingScreen11(onNext: () => _goToNextPage(10)),
            OnboardingScreen12(onNext: () => _goToNextPage(11)),
            OnboardingScreen13(onNext: () {
              SharedPrefs().setOnboarding(true);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TextPaginationScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
