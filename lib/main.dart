import 'package:flutter/material.dart';
import 'package:flutter_freezed/data/widgets/cubit_widget.dart';
import 'package:flutter_freezed/presentation/flutter_freezed_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitWidget(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: const FreezedHome(),
      ),
    );
  }
}
