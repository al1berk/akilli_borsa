import 'package:flutter/material.dart';



class ButtonOne extends StatelessWidget {
  final String text ;
  final VoidCallback onPressed;
   const ButtonOne({
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

class IconButtonOne extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  
  const IconButtonOne({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
