import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final dynamic profile;

  const ProfileDetailsScreen({super.key, required this.profile});

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  String formatConnectionTime(double hours) {
    int totalMinutes = (hours * 60).round();
    int formattedHours = totalMinutes ~/ 60;
    int formattedMinutes = totalMinutes % 60;

    String hoursText = formattedHours == 1 ? 'heure' : 'heures';
    String minutesText = formattedMinutes == 1 ? 'minute' : 'minutes';

    return '$formattedHours $hoursText et $formattedMinutes $minutesText.';
  }

  SizedBox choiceImage(String sexe) {
    if (sexe == "femme") {
      return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset('assets/images/femme.png'),
      );
    } else {
      return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset('assets/images/homme.png'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 183, 6),
        title: Text('${profile['Prenom']} ${profile['Nom']}'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: choiceImage(profile['Sexe']),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 18),
              child: Column(
                children: [
                  Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.8, // 80% de la largeur parente
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue), // Couleur de la bordure
                            borderRadius: BorderRadius.circular(
                                8), // Coins arrondis de la bordure
                          ),
                          padding: const EdgeInsets.all(
                              20), // Espacement intérieur de 20 pixels
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Prénom: ${profile['Prenom']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text('Nom: ${profile['Nom']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text('Sexe: ${profile['Sexe']}'),
                              Text('Âge : ${profile['Age']}'),
                              Text('Email : ${profile['Email']}'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: 0.8, // 80% de la largeur parente
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue), // Couleur de la bordure
                            borderRadius: BorderRadius.circular(
                                8), // Coins arrondis de la bordure
                          ),
                          padding: const EdgeInsets.all(
                              20), // Espacement intérieur de 20 pixels
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date d\'inscription : ${formatDate(profile['DateInscription'])}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Dernière connexion : ${formatDate(profile['DerniereConnexion'])}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Temps total de connexion depuis son inscription : \n${formatConnectionTime(profile['TempsTotalConnexion'])}',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: 0.8, // 80% de la largeur parente
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue), // Couleur de la bordure
                            borderRadius: BorderRadius.circular(
                                8), // Coins arrondis de la bordure
                          ),
                          padding: const EdgeInsets.all(
                              20), // Espacement intérieur de 20 pixels
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Temps de connexion ce mois-ci : ${formatConnectionTime(profile['TempsConnexionDernierMois'])}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Nombre total de connexions : ${profile['NombreTotalConnexions']}',
                              ),
                              Text(
                                'Nombre de connexions ce mois-ci : ${profile['NombreConnexionsDernierMois']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
