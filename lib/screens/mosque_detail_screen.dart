import 'package:flutter/material.dart';
import 'package:prayer_time_app/models/mosque.dart';

class MosqueDetailScreen extends StatelessWidget {
  final Mosque mosque;

  const MosqueDetailScreen({required this.mosque, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mosque Details: ${mosque.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${mosque.name}', style: TextStyle(fontSize: 18)),
            Text('Address: ${mosque.address}', style: TextStyle(fontSize: 18)),
            // Add other details if needed
          ],
        ),
      ),
    );
  }
}
