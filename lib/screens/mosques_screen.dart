import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prayer_time_app/models/mosque.dart';

class MosquesScreen extends StatelessWidget {
  MosquesScreen({super.key});

  final List<Mosque> mosques = [
    Mosque(
        name: 'Mosque 1',
        address: 'Address 1',
        image: Image.asset('assets/images/image1.jpg')),
    Mosque(
        name: 'Mosque 2',
        address: 'Address 2',
        image: Image.asset('assets/images/image2.jpeg')),
    Mosque(
        name: 'Mosque 3',
        address: 'Address 3',
        image: Image.asset('assets/images/image3.avif')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mosques'),
      ),
      body: ListView.builder(
        itemCount: mosques.length,
        itemBuilder: (context, index) {
          final mosque = mosques[index];
          return ListTile(
            title: Text(mosque.name),
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
