import 'package:batareykin/_design/widgets/buttons.dart';
import 'package:batareykin/_design/widgets/texts.dart';
import 'package:batareykin/recycle_batteries/presentation/accrual_of_points_page.dart';
import 'package:flutter/material.dart';

class WaitingForProcessingBatteriesPage extends StatelessWidget {
  const WaitingForProcessingBatteriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTitleText(
                text: 'Автомат №1234' 
              ),
              SizedBox(height: 20),
              CustomDescriptionText(text: 'Олимпийский проспект, 11'),
              Center(
                child: CustomMidleText(text: "Нажмите готово как только положите в автомат все батарейки и мы начислим вам баллы" ,)
              ), 
              SizedBox(height: 20),
              CustomFilledButton(
                text: 'Готово', 
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => AccrualOfPointsPage())), 
                    (route) => false
                  );
                }
              )
            ],
          ),
        )
      ),
    );
  }
}