import 'package:batareykin/auth/presentation/view/register_page.dart';
import 'package:flutter/material.dart';

import '../../../_design/widgets/buttons.dart';
import '../../../_design/widgets/custom_text_field.dart';
import '../../../_design/widgets/texts.dart';
import '../../../home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String passwordError = '';
    String nameError = '';
  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context)=> const RegisterPage()), (route) => false
                  );
                },
                child: const CustomLinkText(text: 'Зарегистрироваться', size: 20),
              ),
              const SizedBox(height: 16),
              CustomFilledButton(
                text: 'Войти', 
                onTap: (){
                  setState(() {
                    if (passwordController.text == '' ||nameController.text == ''){
                      if (passwordController.text == ''){
                        passwordError = 'Вы не ввели пароль';
                      }
                      else{
                        passwordError = '';
                      }
                      if (nameController.text == ''){
                        nameError = 'Вы не ввели e-mail';
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
                  });
                }
              )
            ],
          ),
        ) 
      ),
    );
  }
}