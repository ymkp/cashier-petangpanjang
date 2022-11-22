import 'package:flutter/material.dart';

/// Loading widget with .gif asset
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Loading . . .'),
      ],
    );
  }
}
