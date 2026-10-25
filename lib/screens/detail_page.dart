import 'package:flutter/material.dart';
import '../main.dart';
import '../models/plant.dart';

/// Page 3: full information about one plant.
class DetailPage extends StatelessWidget {
  final Plant plant;
  const DetailPage({super.key, required this.plant});

  // One row of care info (icon + label + value)
  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.clay),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(plant.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colored banner
            Container(
              width: double.infinity,
              height: 180,
              color: plant.color,
              child: const Icon(Icons.eco_rounded, color: Colors.white, size: 90),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plant.name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.forest)),
                  Text(plant.latin,
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                  const SizedBox(height: 16),
                  Text(plant.description),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _infoRow(Icons.wb_sunny_rounded, 'Cahaya', plant.light),
                        _infoRow(Icons.water_drop_rounded, 'Air', plant.water),
                        _infoRow(Icons.speed_rounded, 'Kesulitan', plant.difficulty),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Tips Perawatan',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.forest)),
                  const SizedBox(height: 8),
                  for (final tip in plant.tips)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle_rounded,
                              size: 18, color: AppColors.sage),
                          const SizedBox(width: 8),
                          Expanded(child: Text(tip)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}