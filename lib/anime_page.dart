import 'package:flutter/material.dart';

class AnimePage extends StatefulWidget {
  final String titre;
  final int total;
  const AnimePage({super.key, required this.titre, required this.total});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  int vus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animé')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.titre,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text('Épisodes vus', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            Text(
              '$vus / ${widget.total}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 24),
            LinearProgressIndicator(value: vus / widget.total),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Bouton -1
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (vus > 0) {
                        vus--;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('-1'),
                ),

                // Bouton Zéro
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      vus = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text('Zéro'),
                ),

                // Bouton +1
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (vus < widget.total) {
                        vus++;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                  child: const Text('+1'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
