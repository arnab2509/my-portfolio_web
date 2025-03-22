import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/section_title.dart';
import 'package:portfolio_web/utils/theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16 : (isMediumScreen ? 24 : 32),
        vertical: isSmallScreen ? 32 : 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'About Me'),
          SizedBox(height: isSmallScreen ? 24 : 32),
          isSmallScreen
              ? _buildMobileLayout(controller)
              : _buildDesktopLayout(controller, isMediumScreen),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Obx(() {
            return CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(controller.profile.value.avatar),
            );
          }),
        ),
        const SizedBox(height: 24),
        _buildAboutText(controller),
        const SizedBox(height: 32),
        _buildEducation(controller),
        const SizedBox(height: 32),
        _buildExperience(controller),
      ],
    );
  }

  Widget _buildDesktopLayout(HomeController controller, bool isMediumScreen) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Obx(() {
                return CircleAvatar(
                  radius: isMediumScreen ? 100 : 120,
                  backgroundImage: AssetImage(controller.profile.value.avatar),
                );
              }),
              const SizedBox(height: 32),
              _buildEducation(controller),
            ],
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAboutText(controller),
              const SizedBox(height: 32),
              _buildExperience(controller),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAboutText(HomeController controller) {
    return Obx(
      () => Text(
        controller.profile.value.about,
        style: const TextStyle(
          fontSize: 16,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildEducation(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => Column(
            children: controller.profile.value.education.map((edu) {
              return _buildTimelineItem(
                title: edu['degree'] ?? '',
                subtitle: edu['institution'] ?? '',
                period: edu['duration'] ?? '',
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildExperience(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => Column(
            children: controller.profile.value.experience.map((exp) {
              return _buildTimelineItem(
                title: exp['role'] ?? '',
                subtitle: exp['company'] ?? '',
                period: exp['duration'] ?? '',
                description: exp['description'] ?? '',
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String period,
    String? description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryColor,
                ),
              ),
              Container(
                width: 2,
                height: 60,
                color: AppTheme.primaryColor.withOpacity(0.3),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  period,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
} 