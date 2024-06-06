import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String errMsg;
  const ErrorIndicator({super.key, required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        errMsg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    ));
  }
}
