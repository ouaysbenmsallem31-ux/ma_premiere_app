import 'package:flutter/material.dart';

import 'anime_page.dart';
import 'api.dart';

const List = [
  {'canonicalTitle': 'Death Note', 'episodeCount': 37},
  {'canonicalTitle': 'Hunter x Hunter', 'episodeCount': 148},
  {'canonicalTitle': 'Naruto', 'episodeCount': 220},
];

class ListePage extends StatefulWidget {
  const ListePage({super.key});
  @override
  State<ListePage> createState() => _ListePageState();
}

final futurAnimes = chargerAnimes();

class _ListePageState extends State<ListePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animés')),
      body: FutureBuilder(
        future: futurAnimes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Erreur de chargement'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final animes = snapshot.data!;
          return ListView.builder(
            itemCount: animes.length,
            itemBuilder: (context, index) {
              final anime = animes[index];
              return ListTile(
                leading: Image.network(
anime['posterImage']['small'],
width: 40,
height: 56,
webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
),
                title: Text(anime['canonicalTitle']),
                subtitle: Text("${anime['episodeCount']} épisodes"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimePage(
                        titre: anime['canonicalTitle'],
                        total: anime['episodeCount'],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
