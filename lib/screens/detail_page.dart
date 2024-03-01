import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_buttons.dart';
import 'package:traveling_app/widgets/app_large_text.dart';
import 'package:traveling_app/widgets/app_text.dart';
import 'package:traveling_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/image_7.jpg'))),
              )),
            Positioned(
              left: 20,top: 40,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, 
                color: Colors.white,
                icon: const Icon(Icons.menu)),
                ],
            )),
            Positioned(
              top: 280,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1000,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "text"),
                        AppLargeText(text: "\$250",color: Colors.cyan,)
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                  child: Row(children: [
                    Icon(Icons.location_pin),
                    AppText(text: "text", size: 15)
                  ],),
                  ),
                  const SizedBox(height: 5,),
                  Row(children: [
                    Wrap(
                    children: List.generate(5, (index){
                      return const Icon(Icons.stars,color: Colors.limeAccent,);
                    }),
                  ),
                  const SizedBox(width: 10,),
                  const AppText(text: "5.0", size: 15,color: Colors.blueGrey,)
                  ],),
                  const SizedBox(height: 30,),
                  const AppLargeText(text: "People",size: 35,),
                  const SizedBox(height: 5,),
                  const AppLargeText(text: "Number of People in Your Group",size: 25,),
                  const SizedBox(height: 10,),
                  Wrap(
                    children: List.generate(5, (index){
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: AppButtons(
                            color:selectedIndex == index?Colors.white: Colors.black, 
                            backGroundColor:selectedIndex == index?Colors.black: Colors.blueGrey, 
                            borderColor:selectedIndex == index?Colors.black:Colors.blueGrey, 
                            size: 50,
                            isIcon: false,
                            text: (index+1).toString(),
                            ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20,),
                  const AppLargeText(text: "text",size: 35,),
                  const SizedBox(height: 5,),
                  const AppLargeText(text: "text",size: 25,),
                  ],),              
            )),
             Positioned(
              left: 20,bottom: 40,right: 20,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppButtons(color: Colors.blueGrey, backGroundColor: Colors.white, 
                borderColor: Colors.blueGrey, size: 60, isIcon: true,
                icon: Icons.favorite_border,
                ),
                 const ResponsiveButton(isResponsive: true,),
            ],
            ))
          ],
        ),
      ),
    );
  }
}