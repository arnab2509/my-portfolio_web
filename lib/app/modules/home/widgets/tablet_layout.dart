import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/about_section.dart';
import 'package:portfolio_web/app/modules/home/widgets/contact_section.dart';
import 'package:portfolio_web/app/modules/home/widgets/education_section.dart';
import 'package:portfolio_web/app/modules/home/widgets/footer.dart';
import 'package:portfolio_web/app/modules/home/widgets/hero_section.dart';
import 'package:portfolio_web/app/modules/home/widgets/projects_section.dart';
import 'package:portfolio_web/app/modules/home/widgets/skills_section.dart';
import 'package:portfolio_web/app/modules/home/widgets/social_links.dart';
import 'package:portfolio_web/utils/theme.dart';

class TabletLayout extends GetView<HomeController> {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          controller.profile.value.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )),
        backgroundColor: AppTheme.primaryColor,
        actions: [
          // Navigation buttons for tablet
          TextButton(
            onPressed: () => controller.scrollToSection('home'),
            child: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => controller.scrollToSection('about'),
            child: const Text('About', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => controller.scrollToSection('skills'),
            child: const Text('Skills', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => controller.scrollToSection('projects'),
            child: const Text('Projects', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => controller.scrollToSection('education'),
            child: const Text('Education', style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            icon: Obx(() => Icon(
              controller.isDarkMode.value
                  ? Icons.light_mode
                  : Icons.dark_mode,
            )),
            onPressed: () => controller.toggleTheme(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(() => UserAccountsDrawerHeader(
              accountName: Text(controller.profile.value.name),
              accountEmail: Text(controller.profile.value.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(controller.profile.value.avatar),
              ),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
            )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                controller.scrollToSection('home');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('About'),
              onTap: () {
                controller.scrollToSection('about');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Skills'),
              onTap: () {
                controller.scrollToSection('skills');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Projects'),
              onTap: () {
                controller.scrollToSection('projects');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Education'),
              onTap: () {
                controller.scrollToSection('education');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact'),
              onTap: () {
                controller.scrollToSection('contact');
                Navigator.pop(context);
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SocialLinks(isFooter: true),
              ),
            ),
          ],
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
              // Hero Section
              Container(
                key: controller.sectionKeys['home'],
                child: const HeroSection(isMobile: false),
              ),
              
              // About Section
              Container(
                key: controller.sectionKeys['about'],
                child: const AboutSection(),
              ),
              
              // Skills Section
              Container(
                key: controller.sectionKeys['skills'],
                child: const SkillsSection(),
              ),
              
              // Projects Section
              Container(
                key: controller.sectionKeys['projects'],
                child: const ProjectsSection(),
              ),
              
              // Education Section
              Container(
                key: controller.sectionKeys['education'],
                child: const EducationSection(isMobile: false),
              ),
              
              // Contact Section
              Container(
                key: controller.sectionKeys['contact'],
                child: const ContactSection(),
              ),
              
              // Footer
              const Footer(),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.scrollToSection('home');
        },
        child: const Icon(Icons.arrow_upward),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }
} 