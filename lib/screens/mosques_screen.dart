import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prayer_time_app/models/mosque.dart';

class MosquesScreen extends StatelessWidget {
  MosquesScreen({super.key});

  final List<Mosque> mosques = [
    Mosque(
      name: 'Marhamat jome masjidi',
      address: 'Andijon viloyati, Marhamat tumani, Marhamat shaharchasi',
      image: Image.asset(
        'assets/images/marhamat_jome.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
    Mosque(
      name: 'Ibrohim Halilulloh jome masjidi',
      address: 'Andijon viloyati, Marhamat, Al Buxoriy ko\'chasi',
      image: Image.asset(
        'assets/images/ibrohim_halilulloh.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
    Mosque(
      name: 'O\'qchi jome masjidi',
      address:
          'Andijon viloyati, Marhamat tumani, O\'qchi shaharchasi, Toshloq mahallasi',
      image: Image.asset(
        'assets/images/oqchi_jome.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masjidlar'),
      ),
      body: ListView.builder(
        itemCount: mosques.length,
        itemBuilder: (context, index) {
          final mosque = mosques[index];
          return ListTile(
            title: Text(mosque.name),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              GoRouter.of(context).go(
                '/mosques/mosque/${index + 1}',
                extra: mosque,
              );
            },
          );
        },
      ),
    );
  }
}
