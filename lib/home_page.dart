import 'package:batareykin/_design/widgets/batteries_chart_widget.dart';
import 'package:batareykin/_design/widgets/box_with_data.dart';
import 'package:batareykin/_design/widgets/buttons.dart';
import 'package:batareykin/_design/widgets/texts.dart';
import 'package:batareykin/user/presentation/views/widgets/users_photo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomMidleText(
                        text: "200\$",
                        size: 25,
                      ),
                      UsersPhoto()
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal:20.0),
                  child: BatteriesChartWidget(
                    title: "Ваша статистика: ",
                    highCharged: 80,
                    midCharged: 40,
                    lowCharged: 20,
                  ),
                ),
                const SizedBox(height: 20),
                MenuActionsButtons(
                  title: "Сдать батарейки", 
                  onTap: (){}
                ),
                const SizedBox(height: 15),
                MenuActionsButtons(
                  title: "Найти заряженные", 
                  onTap: (){}
                ),
                const SizedBox(height: 15),
                MenuActionsButtons(
                  title: "Где потратить \$", 
                  onTap: (){}
                ),
                const SizedBox(height: 20),
              ]
            ),
          ),
        ),
      ),
    );
  }
}