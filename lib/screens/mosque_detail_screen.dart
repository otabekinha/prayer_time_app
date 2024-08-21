import 'package:flutter/material.dart';
import 'package:prayer_time_app/models/mosque.dart';

class MosqueDetailScreen extends StatelessWidget {
  final Mosque mosque;

  const MosqueDetailScreen({required this.mosque, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Masjid Tafsilotlari',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: mosque.image,
          ),
          Expanded(
            flex: 2,
            child: DefaultTabController(
              initialIndex: 0,
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.home_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.access_time_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Column(
                          children: [Text(mosque.address)],
                        ),
                        Center(
                          child: Text("It's rainy here"),
                        ),
                        Center(
                          child: Text("It's sunny here"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
