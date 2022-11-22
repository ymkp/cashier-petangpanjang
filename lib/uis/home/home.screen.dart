import 'package:flutter/material.dart';
import 'package:pp_cashier/uis/home/main-app-bar.widget.dart';
import 'package:pp_cashier/uis/home/main-section.widget.dart';
import 'package:pp_cashier/uis/home/main-sidebar.widget.dart';

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // main section
                  Expanded(
                    child: MainSection(),
                  ),
                  SizedBox(width: 10),
                  // sidebar
                  MainSidebar()
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}