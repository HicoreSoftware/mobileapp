import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  // Function to validate email format
  static bool isValidEmail(String email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Function to show a custom toast
  static void showToast(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Function to save the user's email and PIN to SharedPreferences
  static Future<void> saveUserDetails(String email, String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', email);
    prefs.setString('user_pin', pin);
  }

  // Function to get the user's email from SharedPreferences
  static Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }

  // Function to get the user's PIN from SharedPreferences
  static Future<String?> getUserPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_pin');
  }

  // Function to clear user data from SharedPreferences
  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user_email');
    prefs.remove('user_pin');
  }
}
