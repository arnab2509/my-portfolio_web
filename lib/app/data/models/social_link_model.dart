class SocialLinkModel {
  final String name;
  final String url;
  final String icon;
  final String? logo;

  SocialLinkModel({
    required this.name,
    required this.url,
    required this.icon,
    this.logo,
  });

  factory SocialLinkModel.fromJson(Map<String, dynamic> json) {
    return SocialLinkModel(
      name: json['name'] as String,
      url: json['url'] as String,
      icon: json['icon'] as String,
      logo: json['logo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'icon': icon,
      'logo': logo,
    };
  }
} 