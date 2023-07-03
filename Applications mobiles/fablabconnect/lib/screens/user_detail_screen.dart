import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;

// ignore: must_be_immutable
class ProfileDetailsScreen extends StatelessWidget {
  final dynamic profile;
  String currentFirstName;
  String currentLastName;
  final Function updateUser;

  ProfileDetailsScreen({
    Key? key,
    required this.profile,
    required this.currentFirstName,
    required this.currentLastName,
    required this.updateUser,
  });

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

  Future<void> updateProfile(
      int id, String newFirstName, String newLastName) async {
    const username = 'root';
    const password = 'root';

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await http.patch(
      Uri.parse('http://localhost:3000/api/utilisateurs/$id'),
      headers: {'authorization': basicAuth},
      body: {
        'Prenom': newFirstName,
        'Nom': newLastName,
      },
    );

    if (response.statusCode == 200) {
      currentFirstName = newFirstName;
      currentLastName = newLastName;
    } else {
      print('Erreur lors de la mise à jour du profil : ${response.statusCode}');
    }
  }

  pw.Widget _buildProfileContent(dynamic profile) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Prénom: ${profile['Prenom']}'),
        pw.Text('Nom: ${profile['Nom']}'),
        pw.Text('Sexe: ${profile['Sexe']}'),
      ],
    );
  }

  pw.Document _generatePdfDocument(dynamic profile) {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Container(
              padding: pw.EdgeInsets.all(20),
              child: _buildProfileContent(profile),
            ),
          );
        },
      ),
    );

    return pdf;
  }

  void _generatePdfButtonPressed(dynamic profile) {
    final pdf = _generatePdfDocument(profile);

    // Enregistre le PDF sur l'appareil
    pdf.save().then((value) {
      print('PDF généré avec succès');
    }).catchError((error) {
      print('Erreur lors de la génération du PDF : $error');
    });
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String newFirstName = currentFirstName;
    String newLastName = currentLastName;
    currentFirstName = profile['Prenom'];
    currentLastName = profile['Nom'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 183, 6),
        title: Text('${profile['Prenom']} ${profile['Nom']}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Modifier le profil'),
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Nouveau prénom',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  newFirstName = value;
                                });
                              },
                              controller: firstNameController,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Nouveau nom',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  newLastName = value;
                                });
                              },
                              controller: lastNameController,
                            ),
                          ],
                        );
                      },
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Annuler'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: const Text('Enregistrer'),
                        onPressed: () {
                          if (newFirstName.isNotEmpty &&
                              newLastName.isNotEmpty) {
                            updateProfile(
                                    profile['ID'], newFirstName, newLastName)
                                .then((_) {
                              Navigator.pop(context, {
                                'newFirstName': newFirstName,
                                'newLastName': newLastName,
                              });
                            });
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
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
                      ElevatedButton(
                        onPressed: () {
                          _generatePdfButtonPressed(profile);
                        },
                        child: Text('Générer PDF'),
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
