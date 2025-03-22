import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/app/data/models/project_model.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/widgets/project_card.dart';
import 'package:portfolio_web/app/modules/home/widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Determine the number of columns based on screen width
    int crossAxisCount = 3;
    double aspectRatio = 0.8;
    double horizontalPadding = 32.0;
    
    if (screenWidth < 600) {
      crossAxisCount = 1;
      aspectRatio = 0.9;
      horizontalPadding = 16.0;
    } else if (screenWidth < 900) {
      crossAxisCount = 2;
      aspectRatio = 0.85;
      horizontalPadding = 24.0;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Projects'),
          const SizedBox(height: 24),
          Obx(
            () => controller.profile.value.projects.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: controller.profile.value.projects.length,
                    itemBuilder: (context, index) {
                      final ProjectModel project = 
                          controller.profile.value.projects[index];
                      return ProjectCard(
                        title: project.title,
                        description: project.description,
                        image: project.image,
                        tags: project.technologies,
                        logo: project.logo,
                        onTap: () {
                          // Handle project tap
                          // May open a detail page or launch a URL
                          if (project.url != null) {
                            controller.launchURL(project.url!);
                          }
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
} 