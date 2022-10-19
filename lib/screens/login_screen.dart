import 'package:flutter/material.dart';
import 'package:witz/resources/auth_methods.dart';
import 'package:witz/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Начните или присоеденитесь к видеоконференции', style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          CustomButton(text: 'Авторизация через Google', 
          onPressed: () async{ 
            bool res = await _authMethods.signInWithGoogle(context);
            if(res){
               Navigator.pushNamed(context, '/home');
            }
          } ,)
        ],
      ),
    );
  }
}