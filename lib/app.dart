import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveling_app/cubit/app_cubit_logics.dart';
import 'package:traveling_app/cubit/app_cubits.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: ('Traveling App'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home:  BlocProvider<AppCubits>(
        create: (context) =>AppCubits(),
        child: const AppCubitLogics(),
      )
        
    );
  }
}