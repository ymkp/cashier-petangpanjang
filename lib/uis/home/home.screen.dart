import 'package:flutter/material.dart';
import 'package:pp_cashier/uis/home/main-app-bar.widget.dart';
import 'package:pp_cashier/uis/home/main-section.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          MainAppBar(),
          // MainSection(),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: MainSection(),
            ),
          ),
        ],
      ),
    ));
  }
}
