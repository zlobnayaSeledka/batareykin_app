import 'package:flutter/material.dart';

import '../color_theme.dart';
import '../design_parameters.dart';

class BoxWithData extends StatelessWidget {
  final double? height;
  final double? width;
  final int? animation;
  final Widget child;
  const BoxWithData({Key? key, this.width, this.height, this.animation, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return animation==null?Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [DesignParameters.mainShadow],
        color: ColorTheme.backgroundColor,
        borderRadius: BorderRadius.circular(DesignParameters.mainBorderRadius)
      ),
      child: child,
    ):
    AnimatedContainer(
      duration: Duration(milliseconds: animation!),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [DesignParameters.mainShadow],
        color: ColorTheme.backgroundColor,
        borderRadius: BorderRadius.circular(DesignParameters.mainBorderRadius)
      ),
      child: child,
    );
  }
}