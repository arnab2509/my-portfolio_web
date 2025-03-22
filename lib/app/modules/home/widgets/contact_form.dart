import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/contact_controller.dart';
import 'package:portfolio_web/utils/theme.dart';

class ContactForm extends GetView<ContactController> {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate responsive sizes and spacing
    final horizontalPadding = isSmallScreen ? 16.0 : (isMediumScreen ? 20.0 : 24.0);
    final titleFontSize = isSmallScreen ? 20.0 : (isMediumScreen ? 22.0 : 24.0); 
    final buttonHeight = isSmallScreen ? 44.0 : (isMediumScreen ? 46.0 : 48.0);
    final buttonFontSize = isSmallScreen ? 14.0 : (isMediumScreen ? 15.0 : 16.0);
    final fieldSpacing = isSmallScreen ? 12.0 : (isMediumScreen ? 14.0 : 16.0);
    final sectionSpacing = isSmallScreen ? 20.0 : (isMediumScreen ? 22.0 : 24.0);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get In Touch',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            SizedBox(height: sectionSpacing),
            TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isSmallScreen ? 12 : 16,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: fieldSpacing),
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isSmallScreen ? 12 : 16,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Simpler, more reliable email validation
                if (!GetUtils.isEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: fieldSpacing),
            TextFormField(
              controller: controller.messageController,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isSmallScreen ? 12 : 16,
                ),
              ),
              maxLines: isSmallScreen ? 3 : 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            SizedBox(height: sectionSpacing),
            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                    : Text(
                        'Send Message',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: buttonFontSize,
                        ),
                      ),
              )),
            ),
          ],
        ),
      ),
    );
  }
} 