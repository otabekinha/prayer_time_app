import 'package:flutter/material.dart';

class MosqueDetailScreen extends StatelessWidget {
  final String mosqueId;

  const MosqueDetailScreen({required this.mosqueId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mosque Details for $mosqueId'),
      ),
      body: Center(
        child: Text('Details for Mosque $mosqueId'),
      ),
    );
  }
}
