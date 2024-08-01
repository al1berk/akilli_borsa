import 'package:akilli_borsa/Model/user_model.dart';
import 'package:akilli_borsa/View/Widgets/buttons.dart';
import 'package:akilli_borsa/View/Widgets/text_fields.dart';
import 'package:akilli_borsa/View/stock%20markets/markets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/auth_controller.dart';
import '../../Controller/user_controller.dart';
import 'sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  final UserController userController = Get.put(UserController());


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
              print("veri çekildi uid : ${user.uid}");
              await userController.fetchUserByUserID(user.uid);
              UserModel? userModel = userController.user.value ;
              if (userModel != null) {
                print("Kullanıcı oturum açtı uid : ${userModel.id} , ${userModel.userID}");
                print("Kullanıcı adı : ${userModel.username}");
                userController.fetchUserStocks(userModel.userID);
              } else {
                print("kullanıcı bulunamadı");
                userController.addUser(user.uid, "username",emailController.text);
              }
              Get.offAll(Markets());
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
