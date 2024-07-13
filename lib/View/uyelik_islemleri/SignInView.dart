import 'package:akilli_borsa/Model/UserModel.dart';
import 'package:akilli_borsa/View/Widgets/Buttons.dart';
import 'package:akilli_borsa/View/Widgets/textFields.dart';
import 'package:akilli_borsa/View/stock%20markets/Markets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';
import '../../Controller/UserController.dart';
import 'SignUpView.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  final UserController _userController = UserController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giriş Yap',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldOne(labelText: "E Posta", hintText: "E Posta Giriniz",controller: emailController, onChanged: (value)  {

          },),

          TextFieldOne(labelText: "Şifre", hintText: "Şifre Giriniz", controller: passwordController,onChanged: (value){
          }, isPassword: true,),

          ButtonOne(text: "Giriş yap", onPressed: () async {
            User? user = await _authController.signInWithEmailAndPassword(emailController.text, passwordController.text);
            if (user != null) {

              UserModel? userModel = await _userController.getLastUser();
              if (userModel != null) {
                print("Kullanıcı oturum açtı uid : ${userModel.id}");
                print("Kullanıcı adı : ${userModel.username}");
              } else {
                _userController.addUser("username", emailController.text, user.uid);
              }
              Get.to(Markets());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Kullanıcı oturum açma başarısız"),
              ));


            }
          }),
          ButtonOne(text: "Üye Ol", onPressed: (){
            Get.to(() => const SignUpView());
          })

        ],
      ),


    );
  }
}
