import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/utils/theme.dart';

class CustomNavigationBar extends GetView<HomeController> {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate responsive padding
    final horizontalPadding = isSmallScreen ? 20.0 : (isMediumScreen ? 50.0 : 100.0);
    final verticalPadding = isSmallScreen ? 10.0 : 16.0;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding
      ),
      width: double.infinity,
      color: Theme.of(context).colorScheme.background,
      child: isSmallScreen
          ? _buildMobileNavBar(context)
          : _buildDesktopNavBar(context, isMediumScreen),
    );
  }
  
  Widget _buildMobileNavBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo or Name
        Obx(() => Text(
          controller.profile.value.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
        )),
        
        // Drawer menu button and theme toggle
        Row(
          children: [
            // Theme Toggle
            IconButton(
              icon: Obx(() => Icon(
                controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                size: 22,
              )),
              onPressed: controller.toggleTheme,
              tooltip: 'Toggle Theme',
            ),
            
            // Menu Button
            IconButton(
              icon: const Icon(Icons.menu, size: 24),
              onPressed: () {
                // Show drawer with navigation options
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildDesktopNavBar(BuildContext context, bool isMediumScreen) {
    // Calculate font size and spacing based on screen size
    final double fontSize = isMediumScreen ? 14.0 : 16.0;
    final double horizontalSpacing = isMediumScreen ? 10.0 : 16.0;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo or Name
        Obx(() => Text(
          controller.profile.value.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
                fontSize: isMediumScreen ? 18.0 : 20.0,
              ),
        )),
        
        // Navigation Items
        Row(
          children: [
            _buildNavItem(context, 'Home', "home", fontSize, horizontalSpacing),
            _buildNavItem(context, 'About', "about", fontSize, horizontalSpacing),
            _buildNavItem(context, 'Skills', "skills", fontSize, horizontalSpacing),
            _buildNavItem(context, 'Projects', "projects", fontSize, horizontalSpacing),
            _buildNavItem(context, 'Education', "education", fontSize, horizontalSpacing),
            _buildNavItem(context, 'Contact', "contact", fontSize, horizontalSpacing),
            
            // Theme Toggle
            SizedBox(width: horizontalSpacing),
            IconButton(
              icon: Obx(() => Icon(
                controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                size: isMediumScreen ? 20 : 24,
              )),
              onPressed: controller.toggleTheme,
              tooltip: 'Toggle Theme',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String section, double fontSize, double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Obx(() => InkWell(
        onTap: () => controller.scrollToSection(section),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: controller.currentSection.value == _getSectionIndex(section)
                ? AppTheme.primaryColor
                : Theme.of(context).textTheme.titleMedium?.color,
            fontWeight: controller.currentSection.value == _getSectionIndex(section)
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      )),
    );
  }
  
  int _getSectionIndex(String section) {
    switch (section) {
      case "home": return 0;
      case "about": return 1;
      case "skills": return 2;
      case "projects": return 3;
      case "education": return 4;
      case "contact": return 5;
      default: return 0;
    }
  }
} 