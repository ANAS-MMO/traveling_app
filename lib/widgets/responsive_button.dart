import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {

   final bool isResponsive;
   final double? width;

    const ResponsiveButton({super.key,  this.isResponsive=false,  this.width = 120});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true? double.maxFinite :width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10)
          ),
        child:  Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children:  [
            isResponsive==true?Container(margin: const EdgeInsets.only(left: 20),child: const AppText(text: "Book Trip Now", size: 20,color: Colors.black,)):Container(),
            const Icon(Icons.arrow_forward_ios_sharp),
          ],
        ),
      ),
    );
  }
}