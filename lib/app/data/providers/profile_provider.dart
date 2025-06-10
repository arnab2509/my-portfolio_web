import 'package:flutter/material.dart';
import 'package:portfolio_web/app/data/models/profile_model.dart';
import 'package:portfolio_web/app/data/models/project_model.dart';
import 'package:portfolio_web/app/data/models/skill_model.dart';
import 'package:portfolio_web/app/data/models/social_link_model.dart';

class ProfileProvider {
  Future<ProfileModel> getProfile() async {
    // Simulating API call with a delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return ProfileModel(
      name: 'Arnab Mondal',
      title: 'Android App Developer',
      subtitle: 'Web Developer',
      email: 'example@gmail.com',
      phone: '+91 0000000000',
      location: 'Kolkata, India',
      about: '''
Bachelor of Technology in Computer Science and Engineering from Heritage Institute of Technology, Kolkata.

Experience in mobile app development using Flutter and Firebase, as well as web development using ReactJS and database management with MongoDB and MySQL.

Recently completed an internship as an Android Developer at Ardent Computech Pvt. Ltd.
''',
      avatar: 'assets/images/profile2.jpeg',
      projects: [
        ProjectModel(
          title: 'Yumm: Food Delivery App',
          description: 'A cross-platform food delivery application built with Flutter, Firebase, and RESTful APIs.',
          image: 'assets/images/Yumm.jpg',
          logo: 'assets/images/Yumm.jpg',
          technologies: ['Flutter', 'Firebase', 'REST API'],
          url: 'https://github.com/arnab2509/yumm',
        ),
        ProjectModel(
          title: 'Scribble Space',
          description: 'A collaborative note-taking web application with real-time sync and rich text editing.',
          image: 'assets/images/Scribble-Space.png',
          logo: 'assets/images/Scribble-Space.png',
          technologies: ['React', 'Node.js', 'MongoDB'],
          url: 'https://github.com/arnab2509/Scribble-Space',
        ),
      ],
      skills: [
        SkillModel(
          name: 'Flutter',
          percentage: 90,
          icon: 'flutter_dash',
        ),
        SkillModel(
          name: 'Dart',
          percentage: 85,
          icon: 'code',
        ),
        SkillModel(
          name: 'Firebase',
          percentage: 80,
          icon: 'local_fire_department',
        ),
        SkillModel(
          name: 'React',
          percentage: 75,
          icon: 'integration_instructions',
        ),
        SkillModel(
          name: 'Node.js',
          percentage: 70,
          icon: 'dns',
        ),
        SkillModel(
          name: 'MongoDB',
          percentage: 65,
          icon: 'storage',
        ),
      ],
      education: [
        {
          'degree': 'B.Tech in Computer Science and Engineering',
          'institution': 'Heritage Institute of Technology, Kolkata',
          'duration': '2022 - 2025',
        },
        {
          'degree': 'Diploma in Computer Science and Technology',
          'institution': 'Iswar Chandra Vidyasagar Polytechnic College, Jhargram',
          'duration': '2019 - 2022',
        },
      ],
      experience: [
        {
          'role': 'Android Developer Intern',
          'company': 'Ardent Computech Pvt. Ltd.',
          'duration': 'June 2024 - July 2024',
          'description': 'Developed and maintained Android applications using Flutter and Firebase.',
        },
      ],
      socialLinks: [
        SocialLinkModel(
          name: 'GitHub',
          url: 'https://github.com/arnab2509',
          icon: 'code',
          logo: 'assets/images/github-logo.png',
        ),
        SocialLinkModel(
          name: 'LinkedIn',
          url: 'https://www.linkedin.com/in/arnab-mondal-48aa31236/',
          icon: 'business',
          logo: 'assets/images/linkedin logo_icon.png',
        ),
      ],
    );
  }
} 