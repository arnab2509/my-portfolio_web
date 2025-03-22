import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // Simulate sending email
      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;
      nameController.clear();
      emailController.clear();
      messageController.clear();

      Get.snackbar(
        'Success',
        'Thank you for your message!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }
} 