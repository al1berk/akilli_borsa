import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:akilli_borsa/Controller/user_controller.dart';
import 'package:akilli_borsa/View/Widgets/buttons.dart';
import 'package:akilli_borsa/View/Widgets/navigation_bar.dart';
import 'package:akilli_borsa/View/Widgets/profil_info_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Container(
          width: double.infinity, // Make container occupy full width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child:
                  ProfileInfoItem(label: "İsim", value: userController.user.value!.username),
                ) ,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                    ProfileInfoItem(label: "E Posta", value: userController.user.value!.email),


                ),
              ),

              ButtonOne(text: "Premium Ol", onPressed: () {}),
              ButtonOne(text: "Çıkış Yap", onPressed: () {}),
              ButtonOne(text: "Hesabı Sil", onPressed: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

