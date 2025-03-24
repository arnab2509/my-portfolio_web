import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/contact_form.dart';
import 'package:portfolio_web/app/modules/home/widgets/section_title.dart';
import 'package:portfolio_web/app/modules/home/widgets/social_links.dart';
import 'package:portfolio_web/utils/theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final isLargeScreen = screenWidth >= 1200;

    // Calculate responsive padding and spacing
    final horizontalPadding = isSmallScreen ? 12.0 : (isMediumScreen ? 20.0 : 28.0);
    final verticalPadding = isSmallScreen ? 24.0 : 40.0;
    final verticalSpacing = isSmallScreen ? screenHeight * 0.02 : screenHeight * 0.03;

    // Calculate responsive text sizes for section title
    final sectionTitleSize = isSmallScreen ? 22.0 : (isMediumScreen ? 26.0 : (isLargeScreen ? 30.0 : 28.0));

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black87
          : AppTheme.primaryColor.withOpacity(0.05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionTitle(
            title: 'Contact',
            textAlign: TextAlign.center,
            fontSize: sectionTitleSize,
          ),
          SizedBox(height: verticalSpacing),
          isSmallScreen
              ? _buildMobileLayout(controller, context)
              : _buildDesktopLayout(controller, isMediumScreen, context),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(HomeController controller, BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildContactInfo(controller, true, context),
        SizedBox(height: screenHeight * 0.03),
        const ContactForm(),
      ],
    );
  }

  Widget _buildDesktopLayout(HomeController controller, bool isMediumScreen, BuildContext context) {
    // Use wrap for better flexibility on medium-sized screens
    if (isMediumScreen) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildContactInfo(controller, false, context),
          SizedBox(height: 20),
          const ContactForm(),
        ],
      );
    }
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _buildContactInfo(controller, false, context),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Expanded(
          flex: 7,
          child: const ContactForm(),
        ),
      ],
    );
  }

  Widget _buildContactInfo(HomeController controller, bool isMobile, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final isLargeScreen = screenWidth >= 1200;
    
    // Calculate responsive text sizes
    final headingFontSize = isSmallScreen ? 16.0 : (isMediumScreen ? 18.0 : (isLargeScreen ? 20.0 : 18.0));
    final contentSpacing = isSmallScreen ? 8.0 : (isMediumScreen ? 12.0 : 16.0);
    
    return Obx(
      () => Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildContactItem(
            Icons.email,
            'Email',
            controller.profile.value.email,
            isMobile,
            context,
            onTap: () {
              controller.launchURL('mailto:${controller.profile.value.email}');
            },
          ),
          SizedBox(height: contentSpacing),
          _buildContactItem(
            Icons.phone,
            'Phone',
            controller.profile.value.phone,
            isMobile,
            context,
            onTap: () {
              controller.launchURL('tel:${controller.profile.value.phone}');
            },
          ),
          SizedBox(height: contentSpacing),
          _buildContactItem(
            Icons.location_on,
            'Location',
            controller.profile.value.location,
            isMobile,
            context,
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Connect With Me',
            style: TextStyle(
              fontSize: headingFontSize,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          SizedBox(height: contentSpacing),
          SocialLinks(
            isFooter: false,
            iconSize: isSmallScreen ? 20.0 : (isMediumScreen ? 24.0 : (isLargeScreen ? 28.0 : 24.0)),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String title,
    String value,
    bool isMobile,
    BuildContext context, {
    VoidCallback? onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;
    final isLargeScreen = screenWidth >= 1200;
    
    // Calculate responsive sizes - smaller sizes to prevent overflow
    final iconSize = isSmallScreen ? 18.0 : (isMediumScreen ? 22.0 : (isLargeScreen ? 26.0 : 24.0));
    final labelFontSize = isSmallScreen ? 10.0 : (isMediumScreen ? 12.0 : (isLargeScreen ? 14.0 : 12.0));
    final valueFontSize = isSmallScreen ? 12.0 : (isMediumScreen ? 14.0 : (isLargeScreen ? 16.0 : 14.0));
    final containerPadding = isSmallScreen ? 6.0 : (isMediumScreen ? 8.0 : (isLargeScreen ? 12.0 : 10.0));
    final itemSpacing = isSmallScreen ? 8.0 : (isMediumScreen ? 12.0 : 16.0);
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: isMobile ? null : double.infinity,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: onTap != null 
              ? AppTheme.primaryColor.withOpacity(0.05)
              : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(containerPadding),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: AppTheme.primaryColor,
                size: iconSize,
              ),
            ),
            SizedBox(width: itemSpacing),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: labelFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: valueFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (onTap != null) 
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: isSmallScreen ? 12.0 : 14.0,
                  color: AppTheme.primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
} 