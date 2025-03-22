import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/app/data/models/profile_model.dart';
import 'package:portfolio_web/app/data/providers/profile_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final ProfileProvider profileProvider = ProfileProvider();
  final Rx<ProfileModel> profile = Rx<ProfileModel>(ProfileModel(
    name: '',
    title: '',
    subtitle: '',
    email: '',
    phone: '',
    location: '',
    about: '',
    avatar: '',
    projects: [],
    skills: [],
    education: [],
    experience: [],
    socialLinks: [],
  ));
  
  // Set isDarkMode to false by default for light mode
  final RxBool isDarkMode = false.obs;
  final RxInt currentSection = 0.obs;
  final RxBool isLoading = true.obs;
  
  // Map to store section keys for scrolling
  final Map<String, GlobalKey> sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'education': GlobalKey(),
    'contact': GlobalKey(),
  };
  
  // ScrollController for page navigation
  final ScrollController scrollController = ScrollController();
  
  // Prevent recursive updates
  bool _isUpdating = false;

  @override
  void onInit() {
    super.onInit();
    
    // Load profile data
    loadProfile();
    
    // Set light theme by default only on init
    Future.microtask(() {
      Get.changeThemeMode(ThemeMode.light);
    });
    
    // Add scroll listener after a small delay to prevent build-time updates
    Future.microtask(() {
      scrollController.addListener(_updateCurrentSectionOnScroll);
    });
  }

  @override
  void onClose() {
    scrollController.removeListener(_updateCurrentSectionOnScroll);
    scrollController.dispose();
    super.onClose();
  }

  Future<void> loadProfile() async {
    try {
      isLoading.value = true;
      final data = await profileProvider.getProfile();
      profile.value = data;
    } catch (e) {
      debugPrint('Error loading profile: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleTheme() {
    // Use a flag to prevent simultaneous updates
    if (_isUpdating) return;
    
    _isUpdating = true;
    isDarkMode.value = !isDarkMode.value;
    
    Future.microtask(() {
      Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
      _isUpdating = false;
    });
  }

  void changeSection(int index) {
    // Avoid updating during build phase
    if (currentSection.value == index) return;
    
    Future.microtask(() {
      currentSection.value = index;
    });
  }

  void scrollToSection(String section) {
    final sectionIndex = _getSectionIndex(section);
    if (sectionIndex != null) {
      Future.microtask(() => changeSection(sectionIndex));
    }
    
    // Schedule scroll after the current frame
    Future.microtask(() {
      // If the key exists, scroll to it
      if (sectionKeys.containsKey(section) && sectionKeys[section]!.currentContext != null) {
        Scrollable.ensureVisible(
          sectionKeys[section]!.currentContext!,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          alignment: 0.0,
        );
      }
    });
  }
  
  // Helper method to get the section index from section name
  int? _getSectionIndex(String section) {
    switch (section) {
      case "home": return 0;
      case "about": return 1;
      case "skills": return 2;
      case "projects": return 3;
      case "education": return 4;
      case "contact": return 5;
      default: return null;
    }
  }
  
  // Update current section based on scroll position
  void _updateCurrentSectionOnScroll() {
    // Don't update if already updating or during a rebuild
    if (_isUpdating) return;
    
    _isUpdating = true;
    
    // Prevent updating during build phase by wrapping in Future.microtask
    Future.microtask(() {
      // Determine which section is visible
      final sectionEntries = sectionKeys.entries.toList();
      for (int i = sectionEntries.length - 1; i >= 0; i--) {
        final entry = sectionEntries[i];
        if (entry.value.currentContext != null) {
          final renderBox = entry.value.currentContext!.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            final position = renderBox.localToGlobal(Offset.zero);
            // If the section is visible in the viewport
            if (position.dy <= 100) {
              final sectionIndex = _getSectionIndex(entry.key);
              if (sectionIndex != null && currentSection.value != sectionIndex) {
                currentSection.value = sectionIndex;
                break;
              }
            }
          }
        }
      }
      
      _isUpdating = false;
    });
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchEmailUrl(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email client';
    }
  }

  Future<void> launchPhoneUrl(String phone) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phone.replaceAll(' ', ''),
    );
    
    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    } else {
      throw 'Could not launch phone';
    }
  }

  Future<void> launchMapUrl(String location) async {
    final Uri mapsLaunchUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$location');
    
    if (await canLaunchUrl(mapsLaunchUri)) {
      await launchUrl(mapsLaunchUri);
    } else {
      throw 'Could not open maps';
    }
  }

  void downloadCV() {
    // Implementation for CV download
  }
} 