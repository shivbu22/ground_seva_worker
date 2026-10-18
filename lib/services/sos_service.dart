import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SosService {
  static const MethodChannel _channel = MethodChannel('com.ecomins.groundseva/sos');

  static void initialize(BuildContext context, String alertMessage) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'triggerSos') {
        _showSosAlert(context, alertMessage);
      }
    });
  }

  static void _showSosAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.redAccent,
        title: const Icon(Icons.warning_amber_rounded, size: 64, color: Colors.white),
        content: Text(
          message,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('DISMISS', style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
