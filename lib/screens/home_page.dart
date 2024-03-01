import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveling_app/cubit/app_cubits.dart';
import 'package:traveling_app/widgets/app_large_text.dart';
import 'package:traveling_app/widgets/app_text.dart';
import 'package:traveling_app/widgets/responsive_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    "image_0.jpg",
    "image_1.jpg",
    "image_2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: (_, index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: 
            DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/image_$index.jpg"))
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150,right: 20,left: 20),
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppLargeText(text: "Text"),
                    const AppText(text: "text", size: 20),
                    const SizedBox(height: 20,),
                    const SizedBox(
                      width: 250,
                      child: AppText(text: "text", size: 12),
                    ),
                    const SizedBox(height: 40,),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).getData();                   },
                      // ignore: sized_box_for_whitespace
                      child: Container(width: 200,child: const Row(
                        children: [
                           ResponsiveButton(width: 50),
                        ],
                      )))
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots) => Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    width: 8,
                    height: index==indexDots?25:8,
                    decoration: BoxDecoration(
                      color: index==indexDots?Colors.brown:Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8)),
                  )),
                ),
              ],
            ),
          ),
          );
      }
      ),
    );
  }
}