import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class GlobalStatsScreen extends StatelessWidget {
  final List<dynamic> users;

  const GlobalStatsScreen({super.key, required this.users});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 183, 6),
          title: const Text('Tableau de bord des statistiques'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 40.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GlobalStatsScreen(users: users),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.blur_circular, size: 36.0),
                              SizedBox(height: 10.0),
                              Text(
                                "Statistiques de tous les utilisateurs",
                                style: TextStyle(fontSize: 25.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 40.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Naviguer vers la page des statistiques de l'année en cours
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month, size: 36.0),
                              SizedBox(height: 10.0),
                              Text(
                                "Statistiques des utilisateurs de l'année en cours",
                                style: TextStyle(fontSize: 25.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Naviguer vers la page des statistiques du mois
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today, size: 36.0),
                              SizedBox(height: 10.0),
                              Text(
                                "Statistiques des utilisateurs du mois",
                                style: TextStyle(fontSize: 25.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
