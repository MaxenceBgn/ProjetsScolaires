import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:fablabconnect/save_file_web.dart';

// ignore: must_be_immutable
class YearStatsScreen extends StatelessWidget {
  List<dynamic> users;
  int percentageMale = 0;
  int averageAge = 0;
  int totalConnexionNumber = 0;
  String totalConnexionHours = '';
  int userNumber = 0;
  String userNumberString = "";

  YearStatsScreen({super.key, required this.users});

  String formatDate(String dateString) {
    //Convertie un DateTime en String exploitable
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  String formatConnectionTime(double hours) {
    //Convertie un DateTime en String exploitable
    int totalMinutes = (hours * 60).round();
    int formattedHours = totalMinutes ~/ 60;
    int formattedMinutes = totalMinutes % 60;

    String hoursText = formattedHours == 1 ? 'heure' : 'heures';
    String minutesText = formattedMinutes == 1 ? 'minute' : 'minutes';

    return '$formattedHours $hoursText et $formattedMinutes $minutesText.';
  }

  int calculateAverageAge() {
    //Calcule la moyenne d'âge des utilisateurs
    List<int> ages = [];
    for (var i = 0; i < users.length; i++) {
      ages.add(users[i]['Age']);
    }

    double sum = ages.reduce((value, element) => value + element).toDouble();
    double average = sum / ages.length;

    return average.toInt();
  }

  int returnPercentageOfMale() {
    //Calcule le pourcentage d'hommes
    int numberOfMales = 0;
    double percent = 0;
    for (var i = 0; i < users.length; i++) {
      if (users[i]['Sexe'] == "H") {
        numberOfMales++;
      }
    }
    percent = (numberOfMales / users.length) * 100;
    return percent.toInt();
  }

  int returnTotalConnectionNumber() {
    num connectionUserNumber = 0;
    for (var i = 0; i < users.length; i++) {
      connectionUserNumber += users[i]['NombreTotalConnexions'];
    }
    return connectionUserNumber.toInt();
  }

  double calculateNumberOfHoursConnection() {
    double connectionHours = 0;
    for (var i = 0; i < users.length; i++) {
      for (var i = 0; i < users.length; i++) {
        connectionHours += users[i]['TempsConnexionDernierMois'];
      }
    }
    return connectionHours;
  }

  List<dynamic> returnYearUserList() {
    List<dynamic> usersYear = [];

    DateTime now = DateTime.now();
    DateTime firstDayOfYear = DateTime(now.year, 1, 1);

    if (users.isNotEmpty) {
      for (var i = 0; i < users.length; i++) {
        DateTime lastConnection = DateTime.parse(users[i]['DerniereConnexion']);
        if (lastConnection.isAfter(firstDayOfYear) ||
            lastConnection.isAtSameMomentAs(firstDayOfYear)) {
          usersYear.add(users[i]);
        }
      }
    }

    return usersYear;
  }

  Future<void> _createPDF() async {
    //Créé un document PDF
    var document = PdfDocument();

    //Personnalisation du PDF ///////////////////////////////////////////////////////////////////////////////////////////////////

    PdfPage page = document.pages.add();

    //Titre centré
    String text = "";
    PdfTextElement(
            text: text, font: PdfStandardFont(PdfFontFamily.timesRoman, 14))
        .draw(
            page: page,
            bounds: Rect.fromLTWH(0, 0, page.getClientSize().width / 2,
                page.getClientSize().height / 3));

    PdfTextElement(
            text: "Statistiques de l'année en cours",
            font: PdfStandardFont(PdfFontFamily.timesRoman, 14))
        .draw(
            page: page,
            bounds: Rect.fromLTWH(
                page.getClientSize().width / 3,
                0,
                page.getClientSize().width / 3,
                page.getClientSize().height / 3));

    PdfTextElement(
            text: text, font: PdfStandardFont(PdfFontFamily.timesRoman, 14))
        .draw(
            page: page,
            bounds: Rect.fromLTWH(0, 0, page.getClientSize().width / 3,
                page.getClientSize().height / 3));

    //Sauvegarde
    List<int> bytes = await document.save();

    document.dispose();

    //Enregistrement + téléchargement du PDF
    SaveFile.saveAndLaunchFile(bytes, 'output.pdf');
  }

  void initializeVariables() {
    //Initialisation de toutes les variables nécessaires
    users = returnYearUserList();
    averageAge = calculateAverageAge();
    percentageMale = returnPercentageOfMale();
    totalConnexionNumber = returnTotalConnectionNumber();
    totalConnexionHours =
        formatConnectionTime(calculateNumberOfHoursConnection());
    userNumber = users.length;
    userNumberString = userNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    initializeVariables();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 183, 6),
          title: const Text('Statistiques des utilisateurs du mois'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 40.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.supervised_user_circle, size: 100.0),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Nombre d'utilisateurs :",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            userNumberString,
                            style: const TextStyle(fontSize: 25.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Âge moyen des utilisateurs :",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            averageAge.toString(),
                            style: const TextStyle(fontSize: 25.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Pourcentage d'hommes :",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            percentageMale.toString(),
                            style: const TextStyle(fontSize: 25.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Pourcentage de femmes :",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            (100 - percentageMale).toString(),
                            style: const TextStyle(fontSize: 25.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Nombre total de connexions au WIFI (1 connection = 1 demie journée) :",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            totalConnexionNumber.toString(),
                            style: const TextStyle(fontSize: 25.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Nombre total d'heures de connexions au WIFI :",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            totalConnexionHours.toString(),
                            style: const TextStyle(fontSize: 25.0),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _createPDF();
                            },
                            child: const Text('Générer PDF'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
