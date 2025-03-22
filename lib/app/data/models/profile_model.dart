import 'package:portfolio_web/app/data/models/project_model.dart';
import 'package:portfolio_web/app/data/models/skill_model.dart';
import 'package:portfolio_web/app/data/models/social_link_model.dart';

class ProfileModel {
  final String name;
  final String title;
  final String subtitle;
  final String email;
  final String phone;
  final String location;
  final String about;
  final String avatar;
  final List<ProjectModel> projects;
  final List<SkillModel> skills;
  final List<Map<String, String>> education;
  final List<Map<String, String>> experience;
  final List<SocialLinkModel> socialLinks;

  ProfileModel({
    required this.name,
    required this.title,
    required this.subtitle,
    required this.email,
    required this.phone,
    required this.location,
    required this.about,
    required this.avatar,
    required this.projects,
    required this.skills,
    required this.education,
    required this.experience,
    required this.socialLinks,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      about: json['about'] as String,
      avatar: json['avatar'] as String,
      projects: (json['projects'] as List)
          .map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List)
          .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      experience: (json['experience'] as List)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      socialLinks: (json['socialLinks'] as List)
          .map((e) => SocialLinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'subtitle': subtitle,
      'email': email,
      'phone': phone,
      'location': location,
      'about': about,
      'avatar': avatar,
      'projects': projects.map((e) => e.toJson()).toList(),
      'skills': skills.map((e) => e.toJson()).toList(),
      'education': education,
      'experience': experience,
      'socialLinks': socialLinks.map((e) => e.toJson()).toList(),
    };
  }
} 