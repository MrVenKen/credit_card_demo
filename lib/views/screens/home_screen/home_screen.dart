import 'package:detect_bank_from_card/core/constant/responsive_builder.dart';
import 'package:detect_bank_from_card/views/screens/credit_card_screen/credit_card_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit Card Example"),
      ),
      body: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return const CreditCardScreen();
        },
        tabletBuilder: (context, constraints) {
          return const CreditCardScreen();
        },
        desktopBuilder: (context, constraints) {
          return const CreditCardScreen();
        },
      ),
    );
  }
}
