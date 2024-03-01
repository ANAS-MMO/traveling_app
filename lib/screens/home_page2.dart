import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveling_app/cubit/app_cubits.dart';
import 'package:traveling_app/widgets/app_large_text.dart';
import 'package:traveling_app/widgets/app_text.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> with TickerProviderStateMixin {

  List images = [ 
    "image_4.jpg",
    "image_5.jpg",
    "image_6.jpg",
    "image_7.jpg",];
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const AppLargeText(text: "text"),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: tabController,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicator:
                    CircleTabBarIndicator(color: Colors.brown, radius: 4),
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotions")
                ]),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: tabController, children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<AppCubits>(context).detailPage();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12,top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/image_3.jpg'))),
                    ),
                  );
                },
              ),
              const Text("There"),
              const Text("By")
            ]),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "text",size: 20,),
                AppText(text: "text", size: 16),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
              return  Container(
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/${images.elementAt(index)}'))),
                    ),
                    const SizedBox(height: 5,),
                    const SizedBox(child: AppText(text: "text", size: 10),),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleTabBarIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabBarIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
