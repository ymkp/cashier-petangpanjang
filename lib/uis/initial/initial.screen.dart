import 'package:flutter/material.dart';
import 'package:pp_cashier/uis/_shared/loading.widget.dart';

/// Loading screen while initiating hive box
class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoadingWidget()),
    );
  }
}
