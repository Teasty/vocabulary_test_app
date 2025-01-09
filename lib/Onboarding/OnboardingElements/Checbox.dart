import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';

class RoundedCheckboxWithText extends StatefulWidget {
  final String text;
  final ValueChanged<bool?> onChanged;

  const RoundedCheckboxWithText({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedCheckboxWithTextState createState() =>
      _RoundedCheckboxWithTextState();
}

class _RoundedCheckboxWithTextState extends State<RoundedCheckboxWithText> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
       HapticFeedback.lightImpact();
    });
    Timer(const Duration(milliseconds: 450), () {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleCheckbox(!_isChecked);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: _isChecked ? 2 : 1,
                color: _isChecked ? ColorsExt.mainText :ColorsExt.mainLight),
          ),
        ),
        padding: EdgeInsets.only(
            bottom: _isChecked ? 9.0 : 10.0,
            top: 10.0,
            left: 10.0,
            right: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            Text(
              widget.text,
              style: GoogleFonts.ebGaramond(
                fontSize: 18,
                color: ColorsExt.mainText,
              ),
            ),
            Spacer(),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: _isChecked ? ColorsExt.mainText : Colors.transparent,
                border: Border.all(
                  color: _isChecked
                      ? ColorsExt.mainText
                      : ColorsExt.mainLight,
                  width: 1,
                ),
              ),
              child: _isChecked
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: ColorsExt.mainBright
                    )
                  : null,
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
