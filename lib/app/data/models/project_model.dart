class ProjectModel {
  final String title;
  final String description;
  final String image;
  final List<String> technologies;
  final String? url;
  final String? logo;

  ProjectModel({
    required this.title,
    required this.description,
    required this.image,
    required this.technologies,
    this.url,
    this.logo,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      technologies: List<String>.from(json['technologies'] as List),
      url: json['url'] as String?,
      logo: json['logo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'technologies': technologies,
      'url': url,
      'logo': logo,
    };
  }
} 