import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_hover/config.dart';
import 'package:text_hover/constants.dart';

class LetterWidget extends StatefulWidget {
  const LetterWidget({
    Key? key,
    required this.letter,
    required this.config,
    this.animate = false,
  }) : super(key: key);

  final String letter;
  final bool animate;
  final Config config;

  @override
  State<LetterWidget> createState() => _LetterWidgetState();
}

class _LetterWidgetState extends State<LetterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> scaleAnimation;

  late Animation<Offset> translateAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: widget.config.duration,
    );

    scaleAnimation = Tween(begin: 1.0, end: 1.45).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    translateAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(0, -.55)).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate) {
      animationController.forward();
      HapticFeedback.vibrate();
    } else {
      animationController.reverse();
    }

    return SizedBox(
      width: widget.config.letterWidth,
      child: SlideTransition(
        position: translateAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Text(
            widget.letter,
            style: textStyle,
          ),
        ),
      ),
    );
  }

  TextStyle? get textStyle => widget.config.textStyle != null
      ? widget.config.textStyle?.apply(
          color: widget.animate
              ? widget.config.hoverColor
              : widget.config.textColor,
        )
      : Constants.textStyle.apply(
          color: widget.animate
              ? widget.config.hoverColor
              : widget.config.textColor,
        );
}
