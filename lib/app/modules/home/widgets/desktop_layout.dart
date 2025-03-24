import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/skill_card.dart';
import 'package:portfolio_web/app/modules/home/widgets/project_card.dart';
import 'package:portfolio_web/app/modules/home/widgets/contact_form.dart';
import 'package:portfolio_web/app/modules/home/widgets/footer.dart';
import 'package:portfolio_web/app/modules/home/widgets/navigation_bar.dart';
import 'package:portfolio_web/app/modules/home/widgets/education_section.dart';
import 'package:portfolio_web/utils/theme.dart';

class DesktopLayout extends GetView<HomeController> {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
        ),
      ),
      body: Obx(() {
        // Check if profile is loaded
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              // Navigation Bar
              const CustomNavigationBar(),
              
              // Hero Section
              Container(
                key: controller.sectionKeys['home'],
                child: _buildHeroSection(context),
              ),

              // About Section
              Container(
                key: controller.sectionKeys['about'],
                child: _buildAboutSection(context),
              ),
              
              // Skills Section
              Container(
                key: controller.sectionKeys['skills'],
                child: _buildSkillsSection(context),
              ),

              // Projects Section
              Container(
                key: controller.sectionKeys['projects'],
                child: _buildProjectsSection(context),
              ),
              
              // Education Section
              Container(
                key: controller.sectionKeys['education'],
                child: const EducationSection(isMobile: false),
              ),

              // Contact Section
              Container(
                key: controller.sectionKeys['contact'],
                child: _buildContactSection(context),
              ),

              // Footer
              const Footer(),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive values
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate sizing based on screen
    final containerHeight = screenHeight * (isMediumScreen ? 0.8 : 0.9);
    final imageDimension = isMediumScreen ? 250.0 : 300.0;
    final leftPadding = isMediumScreen ? 30.0 : 60.0;
    final titleFontSize = isMediumScreen ? 22.0 : 26.0;
    final nameFontSize = isMediumScreen ? 32.0 : 40.0;
    
    // Adjust button sizes
    final buttonFontSize = isMediumScreen ? 12.0 : 14.0;
    final buttonHorizontalPadding = isMediumScreen ? 12.0 : 16.0;
    final buttonVerticalPadding = isMediumScreen ? 8.0 : 10.0;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal: buttonHorizontalPadding, 
      vertical: buttonVerticalPadding
    );
    
    return Container(
      height: containerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left side with text
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, I\'m',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Obx(() => Text(
                    controller.profile.value.name,
                    style: TextStyle(
                      fontSize: nameFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  const SizedBox(height: 16),
                  Obx(() => AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        controller.profile.value.title,
                        textStyle: TextStyle(
                          fontSize: isMediumScreen ? 18 : 22,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        controller.profile.value.subtitle,
                        textStyle: TextStyle(
                          fontSize: isMediumScreen ? 18 : 22,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  )),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Download CV logic
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: Padding(
                          padding: buttonPadding,
                          child: const Text('Download CV'),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Scroll to contact section
                          controller.scrollToSection("contact");
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppTheme.primaryColor),
                          textStyle: TextStyle(
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: Padding(
                          padding: buttonPadding,
                          child: const Text('Contact Me'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Right side with image
          Expanded(
            flex: 5,
            child: Center(
              child: Obx(() => Container(
                height: imageDimension,
                width: imageDimension,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(controller.profile.value.avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive values
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate sizing based on screen
    final horizontalPadding = isMediumScreen ? 50.0 : 100.0;
    final verticalPadding = isMediumScreen ? 70.0 : 100.0;
    final imageDimension = isMediumScreen ? 300.0 : 400.0;
    final textPadding = isMediumScreen ? 30.0 : 50.0;
    final titleFontSize = isMediumScreen ? 24.0 : 28.0;
    final bodyFontSize = isMediumScreen ? 15.0 : 16.0;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, 
        vertical: verticalPadding
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          // Left side with image
          Expanded(
            flex: 1,
            child: Center(
              child: Obx(() => Container(
                height: imageDimension,
                width: imageDimension,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(controller.profile.value.avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ),
          ),
          
          // Right side with about text
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: textPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Obx(() => Text(
                    controller.profile.value.about,
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      height: 1.6,
                    ),
                  )),
                  const SizedBox(height: 16),
                  // Display experience text if available
                  Obx(() => controller.profile.value.experience.isNotEmpty
                    ? Text(
                        controller.profile.value.experience.first['description'] ?? '',
                        style: TextStyle(
                          fontSize: bodyFontSize,
                          height: 1.6,
                        ),
                      )
                    : const SizedBox.shrink()
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive values
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate sizing based on screen
    final horizontalPadding = isMediumScreen ? 50.0 : 100.0;
    final verticalPadding = isMediumScreen ? 70.0 : 100.0;
    final titleFontSize = isMediumScreen ? 24.0 : 28.0;
    
    // Determine grid properties based on screen size
    final crossAxisCount = isMediumScreen ? 2 : 3;
    final childAspectRatio = isMediumScreen ? 1.2 : 1.5;
    final crossAxisSpacing = isMediumScreen ? 20.0 : 30.0;
    final mainAxisSpacing = isMediumScreen ? 20.0 : 30.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, 
        vertical: verticalPadding
      ),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Text(
            'My Skills',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Obx(() => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: controller.profile.value.skills.length,
            itemBuilder: (context, index) {
              final skill = controller.profile.value.skills[index];
              return SkillCard(
                name: skill.name,
                icon: _getIconData(skill.icon),
                level: skill.percentage / 100,
              );
            },
          )),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    // Map string icon names to Flutter IconData
    switch (iconName.toLowerCase()) {
      case 'flutter':
        return Icons.flutter_dash;
      case 'dart':
        return Icons.code;
      case 'firebase':
        return Icons.fireplace;
      case 'reactjs':
      case 'react':
        return Icons.integration_instructions;
      case 'java':
        return Icons.coffee;
      case 'mongodb':
        return Icons.storage;
      default:
        return Icons.star;
    }
  }

  Widget _buildProjectsSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive values
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate sizing based on screen
    final horizontalPadding = isMediumScreen ? 50.0 : 100.0;
    final verticalPadding = isMediumScreen ? 70.0 : 100.0;
    final titleFontSize = isMediumScreen ? 24.0 : 28.0;
    
    // Determine grid properties based on screen size
    final crossAxisCount = isMediumScreen ? 2 : 3;
    final childAspectRatio = isMediumScreen ? 0.75 : 0.8;
    final crossAxisSpacing = isMediumScreen ? 20.0 : 30.0;
    final mainAxisSpacing = isMediumScreen ? 20.0 : 30.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, 
        vertical: verticalPadding
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'My Projects',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Obx(() => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: controller.profile.value.projects.length,
            itemBuilder: (context, index) {
              final project = controller.profile.value.projects[index];
              return ProjectCard(
                title: project.title,
                description: project.description,
                image: project.image,
                tags: project.technologies,
                logo: project.logo,
                onTap: () => project.url != null ? controller.launchURL(project.url!) : null,
              );
            },
          )),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive values
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate sizing based on screen
    final horizontalPadding = isMediumScreen ? 50.0 : 100.0;
    final verticalPadding = isMediumScreen ? 70.0 : 100.0;
    final titleFontSize = isMediumScreen ? 24.0 : 28.0;
    final bodyFontSize = isMediumScreen ? 15.0 : 16.0;
    final iconSize = isMediumScreen ? 20.0 : 24.0;
    final leftPadding = isMediumScreen ? 30.0 : 50.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, 
        vertical: verticalPadding
      ),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          // Left side with text
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get In Touch',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'I\'m always open to discussing new projects, creative ideas or opportunities to be part of your vision.',
                  style: TextStyle(
                    fontSize: bodyFontSize,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                Obx(() => _buildContactInfo(
                  context,
                  Icons.email,
                  'Email',
                  controller.profile.value.email,
                  iconSize: iconSize,
                  onTap: () => controller.launchEmailUrl(controller.profile.value.email),
                )),
                const SizedBox(height: 16),
                Obx(() => _buildContactInfo(
                  context,
                  Icons.phone,
                  'Phone',
                  controller.profile.value.phone,
                  iconSize: iconSize,
                  onTap: () => controller.launchPhoneUrl(controller.profile.value.phone),
                )),
                const SizedBox(height: 16),
                Obx(() => _buildContactInfo(
                  context,
                  Icons.location_on,
                  'Location',
                  controller.profile.value.location,
                  iconSize: iconSize,
                  onTap: () => controller.launchMapUrl(controller.profile.value.location),
                )),
              ],
            ),
          ),
          
          // Right side with contact form
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: const ContactForm(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(
    BuildContext context, 
    IconData icon, 
    String title, 
    String detail, 
    {VoidCallback? onTap, double iconSize = 24.0}
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final titleFontSize = isMediumScreen ? 18.0 : 20.0;
    final detailFontSize = isMediumScreen ? 14.0 : 16.0;
    
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppTheme.primaryColor,
            size: iconSize,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                detail,
                style: TextStyle(
                  fontSize: detailFontSize,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 