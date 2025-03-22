class SkillModel {
  final String name;
  final int percentage;
  final String icon;

  SkillModel({
    required this.name,
    required this.percentage,
    required this.icon,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] as String,
      percentage: json['percentage'] as int,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'percentage': percentage,
      'icon': icon,
    };
  }
} 