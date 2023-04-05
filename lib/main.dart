import 'package:compare_image/domain/cubits/compare_image/compare_image_cubit.dart';
import 'package:compare_image/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Main());
}

///Root app
class Main extends StatelessWidget {
  ///
  const Main();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CompareImageCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
