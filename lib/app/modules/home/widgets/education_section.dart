import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/section_title.dart';
import 'package:portfolio_web/utils/theme.dart';

class EducationSection extends StatelessWidget {
  final bool isMobile;
  
  const EducationSection({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive values
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    
    // Calculate padding based on screen size
    final horizontalPadding = isSmallScreen ? 16.0 : (isMediumScreen ? 24.0 : 32.0);
    final verticalPadding = isSmallScreen ? 32.0 : 48.0;
    
    // Calculate font sizes
    final degreeFontSize = isSmallScreen ? 16.0 : (isMediumScreen ? 18.0 : 20.0);
    final institutionFontSize = isSmallScreen ? 14.0 : (isMediumScreen ? 15.0 : 16.0);
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.grey[100],
      ),
      child: Column(
        children: [
          const SectionTitle(title: 'Education'),
          SizedBox(height: screenHeight * 0.04),
          _buildEducationList(
            context,
            controller,
            isSmallScreen: isSmallScreen,
            isMediumScreen: isMediumScreen,
            degreeFontSize: degreeFontSize,
            institutionFontSize: institutionFontSize,
          ),
        ],
      ),
    );
  }
  
  Widget _buildEducationList(
    BuildContext context,
    HomeController controller, {
    required bool isSmallScreen,
    required bool isMediumScreen,
    required double degreeFontSize,
    required double institutionFontSize,
  }) {
    return Obx(() {
      final educationList = controller.profile.value.education;
      
      if (educationList.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('No education information available'),
          ),
        );
      }
      
      return Column(
        children: List.generate(
          educationList.length,
          (index) => _buildEducationItem(
            context,
            degree: educationList[index]['degree'] ?? '',
            institution: educationList[index]['institution'] ?? '',
            duration: educationList[index]['duration'] ?? '',
            isSmallScreen: isSmallScreen,
            isMediumScreen: isMediumScreen,
            degreeFontSize: degreeFontSize,
            institutionFontSize: institutionFontSize,
          ),
        ),
      );
    });
  }
  
  Widget _buildEducationItem(
    BuildContext context, {
    required String degree,
    required String institution,
    required String duration,
    required bool isSmallScreen,
    required bool isMediumScreen,
    required double degreeFontSize,
    required double institutionFontSize,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = isSmallScreen 
        ? screenWidth * 0.9
        : (isMediumScreen ? screenWidth * 0.8 : screenWidth * 0.6);
    
    return Container(
      width: cardWidth,
      margin: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 8.0 : 16.0,
      ),
      padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  degree,
                  style: TextStyle(
                    fontSize: degreeFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 8.0 : 12.0,
                  vertical: isSmallScreen ? 4.0 : 6.0,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  duration,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 12.0 : 14.0,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 8.0 : 12.0),
          Row(
            children: [
              Icon(
                Icons.school,
                size: isSmallScreen ? 16.0 : 20.0,
                color: Colors.grey,
              ),
              SizedBox(width: isSmallScreen ? 8.0 : 12.0),
              Expanded(
                child: Text(
                  institution,
                  style: TextStyle(
                    fontSize: institutionFontSize,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 