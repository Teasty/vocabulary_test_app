import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';
import 'package:test_app/Constants/SharedPrefs.dart';
import 'package:test_app/Onboarding/Onboarding.dart';
import 'package:test_app/models/WordModel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool v = await SharedPrefs().onboarding();
  runApp(MyApp(onboarding: v));
}

class MyApp extends StatelessWidget {
  final bool onboarding;

  const MyApp({required this.onboarding});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreens(),
    );
  }
}

class TextPaginationScreen extends StatefulWidget {
  @override
  _TextPaginationScreenState createState() => _TextPaginationScreenState();
}

class _TextPaginationScreenState extends State<TextPaginationScreen> {
  final List<WordModel> textLines = [
    WordModel(
        title: 'hardwood',
        transcription: 'ˈhɑːdwʊd',
        meaning: '(n.) Hard heavy wood from a broadleaved tree',
        example:
            'Environmentalists called for an end to the trade in tropical hardwoods.'),
    WordModel(
        title: 'enshrine ',
        transcription: 'ɪnˈʃraɪn',
        meaning:
            '(v.) To make a law, right, etc. respected or official, especially by stating it in an important written document',
        example: 'The day is enshrined as a key date in American history.'),
    WordModel(
        title: 'wane',
        transcription: 'weɪn',
        meaning: '(v.) To become gradually weaker or less important',
        example: 'Her enthusiasm for the whole idea was waning rapidly.'),
    WordModel(
        title: 'dither',
        transcription: 'ˈdɪðə(r)',
        meaning:
            '(v.) To hesitate about what to do because you are unable to decide',
        example: 'Stop dithering and get on with it.'),
    WordModel(
        title: 'beseech',
        transcription: 'bɪˈsiːtʃ',
        meaning:
            '(v.) To ask somebody for something in an anxious way because you want or need it very much',
        example: 'Let him go, I beseech you!')
  ];
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            _buildWordLoop(),
            _buildTopBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Positioned(
      top: 72,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    color: ColorsExt.mainBright.withAlpha(185),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    Icon(
                      _currentPage >= 4 ? Icons.bookmark : Icons.bookmark_border,
                      size: 16,
                      color: ColorsExt.mainText,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${_currentPage == 5 ? 0 :  _currentPage + 1}/5',
                      style: TextStyle(
                        color: ColorsExt.mainText,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 6,
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: BoxDecoration(
                            color: ColorsExt.mainLight.withAlpha(155),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(microseconds: 200),
                          curve: Curves.easeInOut,
                          height: 6,
                          width: (MediaQuery.of(context).size.width / 25) *
                              (_currentPage >= 5 ? 0 :  _currentPage + 1),
                          decoration: BoxDecoration(
                            color: ColorsExt.mainLight,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWordLoop() {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (pageIndex) {
        setState(() {
          _currentPage = pageIndex;
          if (_currentPage == (textLines.length).ceil()) {
            // Automatically jump back to the first page
            Future.delayed(Duration(milliseconds: 300), () {
              _pageController.jumpToPage(0);
            });
          }
        });
      },
      itemCount: (textLines.length).ceil() + 1, // Add an extra page for looping
      itemBuilder: (context, pageIndex) {
        if (pageIndex == (textLines.length).ceil()) {
          // Empty page at the end
          return SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                textLines[pageIndex].title,
                style: GoogleFonts.ebGaramond(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: ColorsExt.mainText),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                textLines[pageIndex].transcription,
                textAlign: TextAlign.center,
                style: GoogleFonts.ebGaramond(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorsExt.secondaryText),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                textLines[pageIndex].meaning,
                textAlign: TextAlign.center,
                style: GoogleFonts.ebGaramond(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorsExt.secondaryText),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                textLines[pageIndex].example,
                textAlign: TextAlign.center,
                style: GoogleFonts.ebGaramond(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorsExt.secondaryText),
              ),
            ]),
          ),
        );
      },
    );
  }
}
