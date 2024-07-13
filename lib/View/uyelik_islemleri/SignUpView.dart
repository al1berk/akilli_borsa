import 'package:akilli_borsa/View/Widgets/Buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Controller/AuthController.dart';
import '../Widgets/textFields.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final AuthController _authController = AuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üyelik Ol' ,style:TextStyle(color: Colors.white) ,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldOne(labelText: "E Posta", hintText: "E Posta Giriniz",controller: emailController, onChanged: (value){
          },),

          TextFieldOne(labelText: "Şifre", hintText: "Şifre Giriniz", controller: passwordController,onChanged: (value){
          }, isPassword: true,),
          TextFieldOne(labelText: "Şifre Tekrar", hintText: "Şifre Tekrar Giriniz",controller: confirmPasswordController,onChanged: (value){
          }, isPassword: true,),


          ButtonOne(text: "Üye Ol", onPressed: () async {
            if (passwordController.text == confirmPasswordController.text) {
            User? user  = await _authController.registerWithEmailAndPassword(emailController.text, passwordController.text);
            if (user != null) {
              print("Kullanıcı oluşturuldu uid : ${user.uid}");
            } else {
              print("Kullanıcı oluşturulamadı");
            }
            } else {
              print("Şifreler uyuşmuyor");
            }

          })

        ],
      )
    );
  }
}


