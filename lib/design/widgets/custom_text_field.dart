import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color_theme.dart';
import '../other_parameters.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final int? maxLines;
  final int? maxLength;
  final double? width;
  final String? errorText;
  const CustomTextField({Key? key, 
    this.maxLength, 
    this.controller, 
    this.hintText, 
    this.obscureText, 
    this.maxLines,
    this.width,
    this.errorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        boxShadow: [DesignParameters.mainShadow]
      ),
      child: TextField(
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textInputAction: TextInputAction.done,
        obscureText: obscureText == null || obscureText == false?false:true,
        controller: controller,
        maxLines: maxLines,
        style: TextStyle(
          // fontFamily: ColorTheme.mainFontBold,
          color: ColorTheme.mainTextColor,
          fontSize: 22
        ),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignParameters.mainBorderRadius),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignParameters.mainBorderRadius),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignParameters.mainBorderRadius),
            borderSide: BorderSide.none
          ),
          fillColor: ColorTheme.backgroundColor,
          filled: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: ColorTheme.descriptionTextColor,
            fontFamily: DesignParameters.mainFont
          ),
          labelText: errorText,
          //floatingLabelAlignment: FloatingLa,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            color: ColorTheme.errorColor,
            fontFamily: 'GiloryLight',
            fontWeight: FontWeight.normal
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}