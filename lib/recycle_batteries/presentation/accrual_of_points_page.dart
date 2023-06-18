import 'package:batareykin/_design/widgets/buttons.dart';
import 'package:batareykin/_design/widgets/texts.dart';
import 'package:batareykin/home_page.dart';
import 'package:flutter/material.dart';

class AccrualOfPointsPage extends StatelessWidget {
  const AccrualOfPointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTitleText(text: 'Вам начисленно 20\$!'),
              SizedBox(height: 20),
              CustomFilledButton(text: 'Отлично!', onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
              })
            ],
          ),
        )
      ),
    );
  }
}