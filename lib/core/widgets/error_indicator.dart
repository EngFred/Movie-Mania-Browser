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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errMsg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                side: const BorderSide(
                    color: Colors.blue, width: 2), // Outline border
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Reduced corner radius
                ), // Text color
                elevation:
                    0, // Remove shadow to make it look like an outlined button
              ),
              child: const Text(
                "Retry",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ))
        ],
      ),
    ));
  }
}
