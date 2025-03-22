import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_web/widgets/navigation_bar.dart';
import 'package:portfolio_web/widgets/project_card.dart';
import 'package:portfolio_web/widgets/skill_card.dart';
import 'package:portfolio_web/widgets/contact_form.dart';
import 'package:portfolio_web/utils/theme.dart';
import 'package:portfolio_web/widgets/footer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            const CustomNavigationBar(),
            
            // Hero Section
            _buildHeroSection(context),

            // About Section
            _buildAboutSection(context),
            
            // Skills Section
            _buildSkillsSection(context),

            // Projects Section
            _buildProjectsSection(context),

            // Contact Section
            _buildContactSection(context),

            // Footer
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left side with text
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, I\'m',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Arnab Mondal',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Android App Developer',
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Web Developer',
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Download CV logic
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Text('Download CV'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {
                          // Scroll to contact section
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppTheme.primaryColor),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Text('Contact Me'),
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
            flex: 1,
            child: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          // Left side with image
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          
          // Right side with about text
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppTheme.primaryColor,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'I am a passionate Flutter developer with a Bachelor of Technology in Computer Science and Engineering from Heritage Institute of Technology, Kolkata.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'With expertise in mobile app development using Flutter and Firebase, I have successfully developed food delivery apps and content management systems. I also have experience with web development using ReactJS and database management with MongoDB and MySQL.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'I recently completed an internship as an Android Developer at Ardent Computech Pvt. Ltd., where I created custom mobile applications and honed my problem-solving skills.',
                    style: Theme.of(context).textTheme.bodyLarge,
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
    final skills = [
      {'name': 'Flutter', 'icon': Icons.flutter_dash, 'level': 0.9},
      {'name': 'Dart', 'icon': Icons.code, 'level': 0.85},
      {'name': 'Firebase', 'icon': Icons.fireplace, 'level': 0.8},
      {'name': 'React JS', 'icon': Icons.integration_instructions, 'level': 0.75},
      {'name': 'Java', 'icon': Icons.coffee, 'level': 0.7},
      {'name': 'MongoDB', 'icon': Icons.storage, 'level': 0.8},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Text(
            'My Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                ),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.5,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return SkillCard(
                name: skills[index]['name'] as String,
                icon: skills[index]['icon'] as IconData,
                level: skills[index]['level'] as double,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    final projects = [
      {
        'title': 'Yumm: Food Delivery App',
        'description': 'A full-featured food delivery app with Firebase backend and admin panel',
        'image': 'assets/images/project1.jpg',
        'tags': ['Flutter', 'Firebase', 'Authentication'],
      },
      {
        'title': 'Scribble Space',
        'description': 'Content Management System with rich media support',
        'image': 'assets/images/project2.jpg',
        'tags': ['HTML5', 'CSS3', 'JavaScript', 'SQL'],
      },
      {
        'title': 'Internship Project',
        'description': 'Collaborative project built with Flutter and Firebase',
        'image': 'assets/images/project3.jpg',
        'tags': ['Flutter', 'Firebase', 'Team Leadership'],
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'My Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                ),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 0.8,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(
                title: projects[index]['title'] as String,
                description: projects[index]['description'] as String,
                image: projects[index]['image'] as String,
                tags: projects[index]['tags'] as List<String>,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
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
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  'I\'m always open to discussing new projects, creative ideas or opportunities to be part of your vision.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                _buildContactInfo(
                  context,
                  Icons.email,
                  'Email',
                  'arnabmondal2509@gmail.com',
                ),
                const SizedBox(height: 16),
                _buildContactInfo(
                  context,
                  Icons.phone,
                  'Phone',
                  '+91 7602791722',
                ),
                const SizedBox(height: 16),
                _buildContactInfo(
                  context,
                  Icons.location_on,
                  'Location',
                  'Kolkata, India',
                ),
              ],
            ),
          ),
          
          // Right side with contact form
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: ContactForm(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(
      BuildContext context, IconData icon, String title, String detail) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppTheme.primaryColor,
          size: 24,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              detail,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
    );
  }
} 