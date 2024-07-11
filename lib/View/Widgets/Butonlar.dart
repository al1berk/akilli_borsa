import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../grafik.dart';

class ButtonTipBir extends StatelessWidget {
  final String text ;
  final VoidCallback onPressed;
   ButtonTipBir({
     Key? key,
     required this.text,
     required this.onPressed

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF37B7C3),
          shadowColor: const Color(0xFF088395),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        )
        ,child: Text(text));
  }
}