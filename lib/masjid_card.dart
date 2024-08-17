import 'package:flutter/material.dart';

class MasjidCard extends StatelessWidget {
  const MasjidCard(this.masjid, {super.key});

  final String masjid;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(masjid),
        ],
      ),
    );
  }
}
