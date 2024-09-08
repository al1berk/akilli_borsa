import 'package:flutter/material.dart';



class TextFieldOne extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  double width;
  final String labelText , hintText;
   TextFieldOne(
      {Key? key,
        required this.labelText,
        required this.hintText,
        required this.controller,
        required this.onChanged,
        this.isPassword = false,
        this.width = 0.65,
      })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * 0.1,

        child:TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xFF37B7C3),
                width: 2,),

            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xFF088395),
                width: 3,
              ),

            ),


          ),

        ) ,
      ),
    );
  }



}