import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/desktop_layout.dart';
import 'package:portfolio_web/app/modules/home/widgets/mobile_layout.dart';
import 'package:portfolio_web/app/modules/home/widgets/tablet_layout.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define breakpoint constants
    const double mobileBreakpoint = 600;
    const double tabletBreakpoint = 900;
    const double desktopBreakpoint = 1200;
    
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        
        // Mobile layout: width <= 600
        if (maxWidth <= mobileBreakpoint) {
          return const MobileLayout();
        }
        // Tablet layout for sizes between 600 and 900
        else if (maxWidth <= tabletBreakpoint) {
          return const TabletLayout();
        }
        // Medium desktop layout for sizes between 900 and 1200
        else if (maxWidth <= desktopBreakpoint) {
          return const DesktopLayout();
        }
        // Full desktop layout for sizes > 1200
        else {
          return const DesktopLayout();
        }
      },
    );
  }
} 