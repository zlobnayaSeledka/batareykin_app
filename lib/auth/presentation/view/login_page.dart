import 'package:batareykin/auth/presentation/view/register_page.dart';
import 'package:flutter/material.dart';

import '../../../design/widgets/buttons.dart';
import '../../../design/widgets/custom_text_field.dart';
import '../../../design/widgets/texts.dart';
import '../../../home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String passwordError = '';
    String nameError = '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                errorText: nameError,
                controller: nameController,
                hintText: 'e-mail',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                errorText: passwordError,
                controller: passwordController,
                hintText: 'Пароль',
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap:(){
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (context)=> RegisterPage()), (route) => false
                  );
                },
                child: const CustomLinkText(text: 'Зарегистрироваться', size: 20),
              ),
              const SizedBox(height: 16),
              CustomFilledButton(
                text: 'Войти', 
                onTap: ()async{
                  
                  if (passwordController.text == '' ||nameController.text == ''){
                    if (passwordController.text == ''){
                      passwordError = 'Вы не ввели пароль';
                    }
                    else{
                      passwordError = '';
                    }
                    if (nameController.text == ''){
                      nameError = 'Вы не ввели имя пользователя';
                    }
                    else{
                      nameError = '';
                    }
                  }
                  else{
                    nameError = '';
                    passwordError = '';
                    Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(builder: (context)=> const HomePage()), (route) => false
                      );
                  }
                }
              )
            ],
          ),
        ) 
      ),
    );
  }
}