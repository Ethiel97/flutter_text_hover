import 'package:flutter/material.dart';
import 'package:text_hover/constants.dart';

class Config {
  ///[textStyle] This is the text style
  final TextStyle? textStyle;

  ///[duration] This is a user defined duration
  final Duration duration;

  ///[letterWidth] This is the width of a single letter of your text
  final double letterWidth;

  ///[hoverColor] This is the color used when a text letter is hovered
  final Color hoverColor;

  ///[textColor] This is the initial text color before the hover effect
  final Color textColor;

  ///[expand] This is to define whether the text should occupy all the available space
  final bool expand;

  Config({
    this.duration = Constants.duration,
    this.letterWidth = Constants.letterWidth,
    this.hoverColor = Colors.orange,
    this.textColor = Colors.black,
    this.expand = false,
    this.textStyle,
  });
}
