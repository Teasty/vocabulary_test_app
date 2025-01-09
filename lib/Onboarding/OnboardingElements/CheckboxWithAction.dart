import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';

class RoundedCheckboxWithAction extends StatefulWidget {
  final String text;
  final VoidCallback onChanged;

  const RoundedCheckboxWithAction({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedCheckboxWithActionState createState() =>
      _RoundedCheckboxWithActionState();
}

class _RoundedCheckboxWithActionState extends State<RoundedCheckboxWithAction> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
       HapticFeedback.lightImpact();
    });
    Timer(Duration(milliseconds: 450), () {
      widget.onChanged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleCheckbox(!_isChecked);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: ColorsExt.mainLight),
            ),
        ),
        padding: const EdgeInsets.all(10.0),
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
                  color: ColorsExt.mainLight,
                  width: _isChecked ? 6 : 1,
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
