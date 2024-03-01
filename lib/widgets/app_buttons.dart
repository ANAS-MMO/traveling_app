import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  final Color color;
  final Color backGroundColor;
  final Color borderColor;
  double size;
  String? text;
  IconData? icon;
  bool? isIcon;

   AppButtons({super.key, 
  required this.color, 
  required this.backGroundColor, 
  required this.borderColor, 
  required this.size,
  this.text= 'Hi',
  this.icon,
  this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(15),
        color:backGroundColor,
      ),
      child: isIcon==false?Center(child: AppText(text: text! ,color: color, size: 30)):Center(child: Icon(icon,color: color,)),
    );
  }
}
