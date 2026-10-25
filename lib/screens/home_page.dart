import 'package:flutter/material.dart';
import '../data/plant_repository.dart';
import '../main.dart';
import '../models/plant.dart';
import 'detail_page.dart';
import 'list_page.dart';

/// Page 1: welcome header, category cards and recommended plants.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Plant>> _plants;

  @override
  void initState() {
    super.initState();
    _plants = PlantRepository().fetchPlants();
  }

  // Category name, icon and card color
  static const _categories = [
    {'name': 'Indoor', 'icon': Icons.home_rounded, 'color': AppColors.sage},
    {'name': 'Sukulen', 'icon': Icons.filter_vintage_rounded, 'color': AppColors.rose},
    {'name': 'Herbal', 'icon': Icons.grass_rounded, 'color': AppColors.mustard},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Plant>>(
        future: _plants,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final plants = snapshot.data!;

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              // Header
              Container(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).padding.top + 24, 20, 28),
                decoration: const BoxDecoration(
                  color: AppColors.forest,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Daun Rumah',
                        style: TextStyle(
                            color: AppColors.ivory,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('Panduan merawat tanaman hias di rumahmu',
                        style: TextStyle(color: AppColors.sage)),
                  ],
                ),
              ),

              // Categories -> list page
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Text('Kategori',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.forest)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: _categories.map((cat) {
                    final name = cat['name'] as String;
                    final filtered =
                    plants.where((p) => p.category == name).toList();
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ListPage(
                                title: name,
                                color: cat['color'] as Color,
                                plants: filtered),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: cat['color'] as Color,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Icon(cat['icon'] as IconData,
                                  color: AppColors.forest, size: 30),
                              const SizedBox(height: 8),
                              Text(name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.forest)),
                              Text('${filtered.length} tanaman',
                                  style: const TextStyle(
                                      fontSize: 12, color: AppColors.forest)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Recommended -> detail page
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 28, 20, 8),
                child: Text('Rekomendasi Pemula',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.forest)),
              ),
              ...plants.where((p) => p.difficulty == 'Mudah').take(4).map(
                    (p) => Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: p.color,
                      child: const Icon(Icons.eco_rounded, color: Colors.white),
                    ),
                    title: Text(p.name),
                    subtitle: Text(p.latin,
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage(plant: p)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}
