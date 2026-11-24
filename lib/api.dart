import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> chargerAnimes() async {
  final url = Uri.https('kitsu.app', '/api/edge/anime', {
    'filter[subtype]': 'TV',
    'filter[status]': 'finished',
    'sort': 'popularityRank',
    'page[limit]': '12',
  });
  final reponse = await http.get(url);
  final donnees = jsonDecode(reponse.body);
  final animes = [];
  for (final element in donnees['data']) {
    animes.add(element['attributes']);
  }
  return animes;
}
