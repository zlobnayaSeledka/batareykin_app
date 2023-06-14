import 'package:flutter/material.dart';

import '../../design/other_parameters.dart';
import '../color_theme.dart';
import 'box_with_data.dart';
import 'texts.dart';

class CustomFilledButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Function onTap;
  final bool? circular;
  const CustomFilledButton({Key? key, required this.text, this.height, this.width, required this.onTap, this.circular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 10;
    if (circular == true && height!=null){
      radius = height!;
    }
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorTheme.mainColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [DesignParameters.mainShadow]
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: DesignParameters.mainFont,
                fontSize: 20
              ),
            ),
          ),
        )
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final Function? onTap;
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
        if(onTap != null){
          onTap!();
        }
      },
      child: Icon(
        Icons.arrow_back,
        color: ColorTheme.mainTextColor,
        size: 30,
      ),
    );
  }
}

class MenuActionsButtons extends StatelessWidget {
  final String title;
  final Function onTap;
  const MenuActionsButtons({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: GestureDetector(
        onTap: (){
          onTap();
        },
        child: BoxWithData(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomMidleText(
                  text: title,
                  size: 20,
                )
              ],
            ),
          ) 
        ),
      ),
    );
  }
}