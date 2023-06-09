import 'package:detect_bank_from_card/my_custom_scroll_behavior.dart';
import 'package:detect_bank_from_card/views/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetMaterialApp(
        title: 'Flutter Credit Card Example',
        scrollBehavior: MyCustomScrollBehavior(),
        home: const HomeScreen(),
      ),
    );
  }
}
