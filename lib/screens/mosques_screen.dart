import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MosquesScreen extends StatelessWidget {
  const MosquesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mosques'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Mosque ${index + 1}'),
            onTap: () {
              GoRouter.of(context).go('/mosques/mosque/${index + 1}');
            },
          );
        },
      ),
    );
  }
}
