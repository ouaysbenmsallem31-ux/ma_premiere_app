import 'package:flutter/material.dart';

import 'liste_page.dart';
import 'login_page.dart';
import 'main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home, color: Colors.lightGreen),
            title: const Text('Accueil'),
            onTap: () {
              prefs.remove('connecte');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie, color: Colors.lightGreen),
            title: const Text('Animé'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListePage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Déconnexion'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ),
          ),
          const DrawerHeader(
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar1.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
