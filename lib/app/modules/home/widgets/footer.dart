import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/social_links.dart';
import 'package:portfolio_web/utils/theme.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16 : 32,
        vertical: 24,
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.grey[900],
      child: Column(
        children: [
          Obx(
            () => Text(
              controller.profile.value.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isSmallScreen ? 18 : 22,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SocialLinks(isFooter: true),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              TextButton(
                onPressed: () => controller.scrollToSection('home'),
                child: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => controller.scrollToSection('about'),
                child: const Text(
                  'About',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => controller.scrollToSection('skills'),
                child: const Text(
                  'Skills',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => controller.scrollToSection('projects'),
                child: const Text(
                  'Projects',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => controller.scrollToSection('education'),
                child: const Text(
                  'Education',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => controller.scrollToSection('contact'),
                child: const Text(
                  'Contact',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} All Rights Reserved',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
} 