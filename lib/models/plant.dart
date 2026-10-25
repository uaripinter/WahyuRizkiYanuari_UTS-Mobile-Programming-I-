import 'package:flutter/material.dart';

/// Model for one plant. Field names follow the JSON, so the same
/// fromJson can be reused when data comes from an API later.
class Plant {
  final int id;
  final String name;
  final String latin;
  final String category;
  final String light;
  final String water;
  final String difficulty;
  final String colorHex;
  final String description;
  final List<String> tips;

  Plant({
    required this.id,
    required this.name,
    required this.latin,
    required this.category,
    required this.light,
    required this.water,
    required this.difficulty,
    required this.colorHex,
    required this.description,
    required this.tips,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'],
      name: json['name'],
      latin: json['latin'],
      category: json['category'],
      light: json['light'],
      water: json['water'],
      difficulty: json['difficulty'],
      colorHex: json['color'],
      description: json['description'],
      tips: List<String>.from(json['tips']),
    );
  }

  Color get color => Color(int.parse('FF$colorHex', radix: 16));
}