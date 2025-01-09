import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/Constants/ColorsExtention.dart';

class ShrinkableButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool enabled;

  const ShrinkableButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.enabled = true
  }) : super(key: key);

  @override
  _ShrinkableButtonState createState() => _ShrinkableButtonState();
}

class _ShrinkableButtonState extends State<ShrinkableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.90).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    HapticFeedback.lightImpact();
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.enabled ? _handleTapDown : null,
      onTapUp:  widget.enabled ? _handleTapUp : null,
      onTapCancel: widget.enabled ? _handleTapCancel : null,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: widget.enabled ? ColorsExt.mainLight : ColorsExt.mainLight.withAlpha(205),
                borderRadius: BorderRadius.circular(32),
                border: Border(
                  top: BorderSide(color: widget.enabled ? ColorsExt.mainText : ColorsExt.mainText.withAlpha(200), width: 1),
                  left: BorderSide(color: widget.enabled ? ColorsExt.mainText : ColorsExt.mainText.withAlpha(200), width: 1),
                  bottom: BorderSide(color: widget.enabled ? ColorsExt.mainText : ColorsExt.mainText.withAlpha(200), width: 6),
                  right: BorderSide(color: widget.enabled ? ColorsExt.mainText : ColorsExt.mainText.withAlpha(200), width: 1),
                ),
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: GoogleFonts.ebGaramond(
                    color: widget.enabled ? ColorsExt.mainBright : ColorsExt.mainBright.withAlpha(200),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
