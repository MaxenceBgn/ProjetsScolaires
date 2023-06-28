import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final dynamic profile;

  const ProfileDetailsScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${profile['Prenom']} ${profile['Nom']}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Prénom: ${profile['Prenom']}'),
            Text('Nom: ${profile['Nom']}'),
            // Ajoutez d'autres détails du profil que vous souhaitez afficher
          ],
        ),
      ),
    );
  }
}
