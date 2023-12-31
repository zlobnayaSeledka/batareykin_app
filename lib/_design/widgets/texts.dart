import 'package:flutter/material.dart';

import '../color_theme.dart';
import '../design_parameters.dart';

class CustomLinkText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomLinkText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ColorTheme.secondColor,
        fontSize: size,
        fontWeight: FontWeight.w600,
        fontFamily: DesignParameters.mainFont,
        decoration: TextDecoration.none
      ),
    );
  }
}

class CustomTitleText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomTitleText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: ColorTheme.mainTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: DesignParameters.mainFontBold,
        decoration: TextDecoration.none
      ),
    );
  }
}

class CustomDescriptionTitleText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomDescriptionTitleText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: ColorTheme.descriptionTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: DesignParameters.mainFontBold,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class CustomDescriptionText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomDescriptionText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: ColorTheme.descriptionTextColor,
        fontSize: size,
        decoration: TextDecoration.none
      ),
    );
  }
}

class CustomMidleText extends StatelessWidget {
  final String text;
  final double? size;
  final int? maxLines;
  const CustomMidleText({Key? key, required this.text, this.size, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: ColorTheme.mainTextColor,
        fontSize: size,
        fontWeight: FontWeight.w600,
        fontFamily: DesignParameters.mainFont,
        decoration: TextDecoration.none
      ),
    );
  }
} 


class CustomErrorText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomErrorText({Key? key, this.size, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: ColorTheme.errorColor,
        decoration: TextDecoration.none,
        fontFamily: DesignParameters.mainFontLight
      ),
    );
  }
}