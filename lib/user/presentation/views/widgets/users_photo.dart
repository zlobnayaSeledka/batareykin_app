import 'package:batareykin/_design/design_parameters.dart';
import 'package:flutter/material.dart';

import '../../../../_design/color_theme.dart';



class UsersPhoto extends StatelessWidget {
  const UsersPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: ColorTheme.mainColor,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Text(
          'A',
          style: TextStyle(
            color: Colors.white,
            fontFamily: DesignParameters.mainFont,
            fontSize: 35
          ),
        ),
      ),
    );
  }
}