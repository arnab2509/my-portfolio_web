import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/data/models/social_link_model.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/utils/theme.dart';

class SocialLinks extends StatelessWidget {
  final bool isFooter;
  final double? iconSize;
  
  const SocialLinks({
    Key? key,
    this.isFooter = false,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.profile.value.socialLinks.isEmpty
              ? const SizedBox()
              : Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: isFooter ? WrapAlignment.center : WrapAlignment.start,
                  children: controller.profile.value.socialLinks
                      .map((SocialLinkModel link) => _buildSocialLink(
                            context,
                            link,
                            isSmallScreen,
                          ))
                      .toList(),
                ),
    );
  }

  Widget _buildSocialLink(
    BuildContext context,
    SocialLinkModel link,
    bool isSmallScreen,
  ) {
    // Use provided iconSize or calculate based on screen size and footer status
    final defaultIconSize = isSmallScreen ? 24.0 : (isFooter ? 28.0 : 32.0);
    final socialIconSize = iconSize ?? defaultIconSize;
    
    final padding = isSmallScreen ? 8.0 : 12.0;
    
    return InkWell(
      onTap: () {
        final controller = Get.find<HomeController>();
        controller.launchURL(link.url);
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: isFooter
              ? Colors.white.withOpacity(0.1)
              : AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: link.logo != null
            ? Image.asset(
                link.logo!,
                height: socialIconSize,
                width: socialIconSize,
              )
            : Icon(
                _getSocialIcon(link.name),
                color: isFooter ? Colors.white : AppTheme.primaryColor,
                size: socialIconSize,
              ),
      ),
    );
  }

  IconData _getSocialIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.business_center;
      case 'twitter':
        return Icons.message;
      case 'instagram':
        return Icons.camera_alt;
      case 'facebook':
        return Icons.facebook;
      case 'dribbble':
        return Icons.sports_basketball;
      case 'behance':
        return Icons.brush;
      case 'medium':
        return Icons.article;
      case 'dev':
        return Icons.code;
      case 'stackoverflow':
        return Icons.question_answer;
      case 'youtube':
        return Icons.video_library;
      case 'whatsapp':
        return Icons.chat;
      case 'telegram':
        return Icons.send;
      default:
        return Icons.link;
    }
  }
} 