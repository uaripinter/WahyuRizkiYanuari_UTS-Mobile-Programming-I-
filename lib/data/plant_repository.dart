import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/plant.dart';

class PlantRepository {
  Future<List<Plant>> fetchPlants() async {
    final raw = await rootBundle.loadString('assets/data/plants.json');
    final list = jsonDecode(raw) as List;
    return list.map((e) => Plant.fromJson(e)).toList();
  }
}
