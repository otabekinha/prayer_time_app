import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:prayer_time_app/masjid_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List masjids = [
    'Shomad jome masjidi',
    'Marhamat jome masjidi',
    'Ibrohim Halilulloh jome masjidi',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Namoz Vaqtlari'),
      ),
      bottomNavigationBar: Container(
        color: Colors.green.shade700,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.green.shade700,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.green.shade600,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.mosque_outlined,
                text: 'Masjidlar',
              ),
              GButton(
                icon: Icons.check,
                text: 'Xozir',
              ),
              GButton(
                icon: Icons.history_toggle_off,
                text: 'Namoz',
              ),
              GButton(
                icon: Icons.settings_outlined,
                text: 'Sozlamalar',
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: masjids.length,
          itemBuilder: (_, index) {
            return MasjidCard(
              masjids[index],
            );
          },
        ),
      ),
    );
  }
}
