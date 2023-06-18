import 'package:batareykin/_design/widgets/buttons.dart';
import 'package:batareykin/_design/widgets/custom_text_field.dart';
import 'package:batareykin/recycle_batteries/presentation/waiting_for_processing_batteries_page.dart';
import 'package:flutter/material.dart';

class ChooseDeviceByUniqeCode extends StatelessWidget {
  const ChooseDeviceByUniqeCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CustomBackButton()
                ],
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextField(),
                      const SizedBox(height: 40),
                      CustomFilledButton(
                        text: 'Найти устройство', 
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WaitingForProcessingBatteriesPage()));
                        }
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}