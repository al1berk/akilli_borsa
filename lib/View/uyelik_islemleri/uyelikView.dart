import 'package:akilli_borsa/View/Widgets/Butonlar.dart';
import 'package:flutter/material.dart';

import '../Widgets/textFields.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üyelik İşlemleri' ,style:TextStyle(color: Colors.white) ,),
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


          ButtonTipBir(text: "Üye Ol", onPressed: (){

          })

        ],
      )
    );
  }
}


