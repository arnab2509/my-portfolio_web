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
    final horizontalPadding = isSmallScreen ? 12.0 : (isMediumScreen ? 24.0 : 40.0);
    final verticalPadding = isSmallScreen ? 8.0 : 12.0;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding
      ),
      width: double.infinity,
      color: Theme.of(context).colorScheme.background,
      child: isSmallScreen
          ? _buildMobileNavBar(context)
          : _buildDesktopNavBar(context, isMediumScreen, screenWidth),
    );
  }
  
  Widget _buildMobileNavBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo or Name
        Flexible(
          child: Obx(() => Text(
            controller.profile.value.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
            overflow: TextOverflow.ellipsis,
          )),
        ),
        
        // Drawer menu button and theme toggle
        Row(
          children: [
            // Theme Toggle
            IconButton(
              icon: Obx(() => Icon(
                controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                size: 20,
              )),
              onPressed: controller.toggleTheme,
              tooltip: 'Toggle Theme',
              padding: const EdgeInsets.all(8.0),
              constraints: const BoxConstraints(),
            ),
            
            // Menu Button
            IconButton(
              icon: const Icon(Icons.menu, size: 22),
              onPressed: () {
                // Show drawer with navigation options
                Scaffold.of(context).openEndDrawer();
              },
              padding: const EdgeInsets.all(8.0),
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildDesktopNavBar(BuildContext context, bool isMediumScreen, double screenWidth) {
    // Calculate font size and spacing based on screen size
    final double fontSize = isMediumScreen ? 13.0 : 15.0;
    final double horizontalSpacing = isMediumScreen ? 6.0 : 10.0;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo or Name
        Flexible(
          flex: 1,
          child: Obx(() => Text(
            controller.profile.value.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                  fontSize: isMediumScreen ? 16.0 : 18.0,
                ),
            overflow: TextOverflow.ellipsis,
          )),
        ),
        
        // Navigation Items in a scrollable container for medium screens
        Flexible(
          flex: isMediumScreen ? 3 : 2,
          child: screenWidth < 800 
            ? _buildScrollableNavItems(context, fontSize, horizontalSpacing)
            : _buildRegularNavItems(context, fontSize, horizontalSpacing),
        ),
      ],
    );
  }

  Widget _buildScrollableNavItems(BuildContext context, double fontSize, double horizontalSpacing) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
              size: 20,
            )),
            onPressed: controller.toggleTheme,
            tooltip: 'Toggle Theme',
            padding: const EdgeInsets.all(6.0),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildRegularNavItems(BuildContext context, double fontSize, double horizontalSpacing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
            size: 22,
          )),
          onPressed: controller.toggleTheme,
          tooltip: 'Toggle Theme',
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