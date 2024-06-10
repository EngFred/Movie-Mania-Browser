import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String errMsg;
  final VoidCallback onRetry;
  const ErrorIndicator(
      {super.key, required this.errMsg, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        errMsg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    ));
  }
}
