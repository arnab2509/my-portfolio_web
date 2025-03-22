import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/desktop_layout.dart';
import 'package:portfolio_web/widgets/mobile_layout.dart';
import 'package:portfolio_web/widgets/tablet_layout.dart';
import 'package:portfolio_web/utils/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileLayout: MobileLayout(),
        tabletLayout: TabletLayout(),
        desktopLayout: DesktopLayout(),
      ),
    );
  }
} 