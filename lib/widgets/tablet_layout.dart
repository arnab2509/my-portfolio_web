import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_web/utils/theme.dart';
import 'package:portfolio_web/widgets/navigation_bar.dart';
import 'package:portfolio_web/widgets/project_card.dart';
import 'package:portfolio_web/widgets/skill_card.dart';
import 'package:portfolio_web/widgets/contact_form.dart';
import 'package:portfolio_web/widgets/footer.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('John Doe'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(
        minHeight: 400,
        maxHeight: screenHeight > 600 ? screenHeight * 0.7 : 400,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hero section
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Hello, I\'m',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                'Arnab Mondal',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Download CV logic
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text('Contact Me'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 300,
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
              const SizedBox(width: 40),
              Expanded(
                flex: 1,
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
                      'I specialize in mobile and web app development with experience in Flutter, Firebase, and ReactJS.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
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
      padding: const EdgeInsets.all(40.0),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Text(
            'My Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
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
      padding: const EdgeInsets.all(40.0),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'My Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 0.9,
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
      padding: const EdgeInsets.all(40.0),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'I\'m always open to discussing new projects, creative ideas or opportunities to be part of your vision.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactInfo(
                context,
                Icons.email,
                'Email',
                'arnabmondal2509@gmail.com',
              ),
              _buildContactInfo(
                context,
                Icons.phone,
                'Phone',
                '+91 7602791722',
              ),
              _buildContactInfo(
                context,
                Icons.location_on,
                'Location',
                'Kolkata, India',
              ),
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.15),
            child: ContactForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(
      BuildContext context, IconData icon, String title, String detail) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppTheme.primaryColor,
          size: 32,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          detail,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                onPressed: () {},
                color: AppTheme.primaryColor,
                iconSize: 28,
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
                color: AppTheme.primaryColor,
                iconSize: 28,
              ),
              IconButton(
                icon: const Icon(Icons.language),
                onPressed: () {},
                color: AppTheme.primaryColor,
                iconSize: 28,
              ),
              IconButton(
                icon: const Icon(Icons.code),
                onPressed: () {},
                color: AppTheme.primaryColor,
                iconSize: 28,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} John Doe. All Rights Reserved.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 