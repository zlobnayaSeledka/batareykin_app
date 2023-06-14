import 'package:batareykin/auth/presentation/view/login_page.dart';
import 'package:flutter/material.dart';

import '../../../design/widgets/buttons.dart';
import '../../../design/widgets/custom_text_field.dart';
import '../../../design/widgets/texts.dart';
import '../../../home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String nameError = '';
  String passwordError = '';
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
                hintText: 'Имя',
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
                    MaterialPageRoute(builder: (context)=> const LoginPage()), (route) => false
                  );
                },
                child: const CustomLinkText(text: 'Войти', size: 20),
              ),
              const SizedBox(height: 16),
              CustomFilledButton(
                text: 'Зарегистрироваться', 
                onTap: ()async{
                  if (nameController.text == '' || passwordController.text == ''){
                    setState(() {
                      if (nameController.text == ''){
                        nameError = 'Придумайте имя пользователя';
                      }
                      else{
                        nameError = '';
                      }
                      if (passwordController.text == ''){
                        passwordError = 'Придумайте пароль';
                      }
                      else{
                        passwordError = '';
                      }
                    });
                  }
                  else{
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