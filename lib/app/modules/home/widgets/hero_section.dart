import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/social_links.dart';
import 'package:portfolio_web/utils/theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;

  const HeroSection({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16 : 32,
        vertical: isSmallScreen ? 32 : 64,
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black87
          : AppTheme.primaryColor.withOpacity(0.05),
      child: isMobile || isSmallScreen
          ? _buildMobileLayout(context, controller, isSmallScreen)
          : _buildDesktopLayout(context, controller, isMediumScreen),
    );
  }

  Widget _buildMobileLayout(BuildContext context, HomeController controller, bool isSmallScreen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return CircleAvatar(
            radius: isSmallScreen ? 60 : 80,
            backgroundImage: AssetImage(controller.profile.value.avatar),
          );
        }),
        const SizedBox(height: 24),
        Obx(
          () => Text(
            controller.profile.value.name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 24 : 32,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                controller.profile.value.title,
                textStyle: TextStyle(
                  fontSize: isSmallScreen ? 16 : 20,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryColor,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                controller.profile.value.subtitle,
                textStyle: TextStyle(
                  fontSize: isSmallScreen ? 16 : 20,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryColor,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            repeatForever: true,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
          ),
        ),
        const SizedBox(height: 24),
        const SocialLinks(),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            controller.downloadCV();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Download CV',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, HomeController controller, bool isMediumScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  controller.profile.value.name,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMediumScreen ? 36 : 48,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      controller.profile.value.title,
                      textStyle: TextStyle(
                        fontSize: isMediumScreen ? 20 : 24,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      controller.profile.value.subtitle,
                      textStyle: TextStyle(
                        fontSize: isMediumScreen ? 20 : 24,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  repeatForever: true,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                ),
              ),
              const SizedBox(height: 24),
              const SocialLinks(),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  controller.downloadCV();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Download CV',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 32),
        Obx(() {
          return CircleAvatar(
            radius: isMediumScreen ? 100 : 120,
            backgroundImage: AssetImage(controller.profile.value.avatar),
          );
        }),
      ],
    );
  }
} 