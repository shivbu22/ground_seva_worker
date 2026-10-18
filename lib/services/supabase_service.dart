import 'package:flutter/material.dart';

class SupabaseService extends ChangeNotifier {
  bool isAuthenticated = false;

  Future<void> sendOtp(String phone) async {
    // Mock Supabase OTP send
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<bool> verifyOtp(String phone, String otp) async {
    // Mock Supabase OTP verify
    await Future.delayed(const Duration(seconds: 1));
    if (otp == '123456') {
      isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    isAuthenticated = false;
    notifyListeners();
  }
}
