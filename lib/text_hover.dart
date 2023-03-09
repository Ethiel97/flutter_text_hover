library text_hover;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:text_hover/config.dart';

import 'letter_widget.dart';

class TextHover extends StatefulWidget {
  const TextHover({
    Key? key,
    required this.text,
    required this.config,
  }) : super(key: key);

  ///[config] this is the config of the hover effect
  final Config config;

  ///[text] this is the text to apply the hover effect on
  final String text;

  @override
  State<TextHover> createState() => _TextHoverState();
}

class _TextHoverState extends State<TextHover> {
  Offset? dragUpdateDetails;

  bool isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  bool get isDesktopOrWeb =>
      kIsWeb ||
      (Platform.isLinux ||
          Platform.isMacOS ||
          Platform.isWindows ||
          Platform.isFuchsia);

  handleHoverLogic(i) => isDesktopOrWeb ? isHovered : handleDragLogic(i);

  handleDragLogic(i) {
    if (dragUpdateDetails != null) {
      return ((i - 1) * widget.config.letterWidth) <=
              dragUpdateDetails?.dx.toInt() &&
          (dragUpdateDetails?.dx.toInt())! <= (i * widget.config.letterWidth);
    }

    return false;
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (e) => {
          setState(() => {isHovered = true})
        },
        onExit: (e) => {
          setState(() => {isHovered = false})
        },
        child: GestureDetector(
          onHorizontalDragStart: (details) {
            // print(details.localPosition);
            setState(() => {dragUpdateDetails = details.localPosition});
          },
          onHorizontalDragUpdate: (details) {
            setState(() => {dragUpdateDetails = details.localPosition});
          },
          onHorizontalDragCancel: () {
            setState(() {
              dragUpdateDetails = null;
            });
          },
          onHorizontalDragEnd: (details) {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.text
                .split("")
                .asMap()
                .entries
                .map(
                  (e) => Flexible(
                    fit: widget.config.expand ? FlexFit.tight : FlexFit.loose,
                    child: LetterWidget(
                      letter: e.value,
                      config: widget.config,
                      animate: handleHoverLogic(e.key + 1),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
