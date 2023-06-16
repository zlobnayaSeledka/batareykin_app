import 'package:batareykin/_design/widgets/buttons.dart';
import 'package:batareykin/_design/widgets/texts.dart';
import 'package:batareykin/user/presentation/views/widgets/users_photo.dart';
import 'package:flutter/material.dart';

import '../../../_design/widgets/box_with_data.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CustomBackButton(),
                        SizedBox(width: 15),
                        CustomTitleText(
                          text: "Профиль",
                          size: 27,
                        ),
                      ],
                    ),
                    const UsersPhoto()
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: BoxWithData(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomDescriptionText(text: "имя фамилия", size: 20),
                  )
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: BoxWithData(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomDescriptionText(text: "example@email.com", size: 20),
                  )
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: CustomTitleText(
                  text: "Ваш счёт 200\$",
                  size: 25,
                ),
              ),  
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CustomTitleText(
                  text: "История транзакций",
                  size: 25,
                )
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
                      child: BoxWithData(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const  CustomDescriptionText(text: "02.03.2023", size: 17),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width-80)/2,
                                    child: const CustomMidleText(text: 'Автомат у входа в зал', size: 20)
                                  ),
                                  const CustomTitleText(text: '+200\$', size: 20)
                                ],
                              )
                            ],
                          ),
                        )
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
      ),
    );
  }
}