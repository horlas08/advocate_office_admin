import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonSnackBarMessage {

  static noInternetConnection() {
    Get.snackbar("أنت غير متصل !!", "يرجى التحقق من الاتصال بالإنترنت.",
        backgroundColor: Colors.red.shade50,
        colorText: Colors.redAccent,
        maxWidth: 300,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 1),
        overlayBlur: 5,
        icon: const Icon(
          Icons.wifi_off_outlined,
          color: Colors.red,
        ),
        snackPosition: SnackPosition.TOP);
  }

  static errorMessage({String? title, required String text}) {
    Get.snackbar(title ?? "رسالة", text,
        maxWidth: 300,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.red.shade50,
        duration: const Duration(seconds: 2),
        overlayBlur: 3,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP);
  }

  static successMessage({String? title, required String text, IconData? icon}) {
    Get.snackbar(title ?? "ناجح", text,
        maxWidth: 300,
        icon: Icon(
          icon ?? Icons.verified_user_sharp,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff002B5B),
        duration: const Duration(seconds: 2),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP);
  }
}
