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
        title: Text('${profile['Prenom']} ${profile['Nom']}'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20),
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              child: choiceImage(profile['Sexe']),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Prénom: ${profile['Prenom']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'Nom: ${profile['Nom']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text('Sexe: ${profile['Sexe']}'),
          ),
          Center(
            child: Text('Âge : ${profile['Age']}'),
          ),
          Center(
            child: Text('Email : ${profile['Email']}'),
          ),
          Center(
            child: Text(
              'Date d\'inscription : ${formatDate(profile['DateInscription'])}',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Dernière connexion : ${formatDate(profile['DerniereConnexion'])}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'Temps total de connexion depuis son inscription : ${formatConnectionTime(profile['TempsTotalConnexion'])}',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Temps de connexion ce mois-ci : ${formatConnectionTime(profile['TempsConnexionDernierMois'])}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'Nombre total de connexions : ${profile['NombreTotalConnexions']}',
            ),
          ),
          Center(
            child: Text(
              'Nombre de connexions ce mois-ci : ${profile['NombreConnexionsDernierMois']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
