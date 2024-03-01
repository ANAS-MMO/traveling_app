import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveling_app/cubit/app_cubit_states.dart';
import 'package:traveling_app/cubit/app_cubits.dart';
import 'package:traveling_app/screens/detail_page.dart';
import 'package:traveling_app/screens/home_page.dart';
import 'package:traveling_app/screens/nav_pages/main_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeStates){
            return const HomePage();
          }if (state is LoadedStates){
            return const MainPage();
          }if (state is LoadingStates){
            return const Center(
								child: CircularProgressIndicator(),
							);
          }if (state is DetailStates){
            return const DetailPage();
          }else{
            return const Center(
								child: CircularProgressIndicator(),
							);
          }
        },
      ),
    );
  }
}