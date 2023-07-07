import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:fablabconnect/save_file_web.dart';
import 'utils.dart';

// ignore: must_be_immutable
class YearStatsScreen extends StatelessWidget {
  List<dynamic> users;
  int numberOfMales = 0;
  int percentageMale = 0;
  int averageAge = 0;
  int totalConnexionNumber = 0;
  String totalConnexionHours = '';
  int userNumber = 0;
  String userNumberString = "";
  int year = 0;
  Map<String, int> towns = {};

  int ageMin = 100;
  int ageMax = 0;
  int ageMinFemale = 100;
  int ageMaxFemale = 0;
  int ageMinMale = 100;
  int ageMaxMale = 0;
  int averageAgeFemale = 0;
  int averageAgeMale = 0;

  YearStatsScreen({super.key, required this.users});

  //Retourne la liste des utilisateurs avec le filtre (ici, cela ne concerne que les utilisateurs dont la dernière connexion date de l'année en cours)
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

  //Création du PDF résumant les statistiques de l'année en cours
  Future<void> _createPDF() async {
    //Créé un document PDF
    var document = PdfDocument();

    //PERSONNALISATION DU PDF ///////////////////////////////////////////////////////////////////////////////////////////////////

    PdfPage page = document.pages.add();

    // Titre en haut
    String title = "Statistiques de l'année ${year.toString()}";
    final font = PdfStandardFont(PdfFontFamily.helvetica, 24);

    final titleSize = font.measureString(title);
    final titleX = (page.getClientSize().width - titleSize.width) / 2;
    double titleY = 0;

    page.graphics.drawString(
      title,
      font,
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: Rect.fromLTWH(titleX, titleY, titleSize.width, titleSize.height),
    );

// Corps du PDF
    double textElementX = 0;
    final textElementY = titleSize.height + 10;

    PdfTextElement textElement = PdfTextElement(
      text:
          "Répartition des utilisateurs : \nNombre d'utilisateurs s'étant connectés au moins une fois en ${year.toString()} : $userNumberString.\n$numberOfMales (${percentageMale.toString()}%) sont des hommes, et ${(userNumber - numberOfMales).toString()} (${(100 - percentageMale).toString()}%) sont des femmes.\n\n  \nÂge des utilisateurs : \nMoyenne d'âge des utilisateurs : ${averageAge.toString()} ans (le plus jeune a $ageMin et le plus âgé a $ageMax). \nHommes : la moyenne d'âge est de ${averageAgeMale.toString()}, le plus jeune a $ageMinMale ans et le plus ancien a $ageMaxMale \nFemmes : la moyenne d'âge est de ${averageAgeFemale.toString()}, le plus jeune a $ageMinFemale ans et le plus ancien a $ageMaxFemale",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );
    textElement.draw(
      page: page,
      bounds: Rect.fromLTWH(
          textElementX,
          textElementY,
          page.getClientSize().width,
          page.getClientSize().height - titleSize.height - 10),
    );

// Sauvegarde
    List<int> bytes = await document.save();

    document.dispose();

// Enregistrement + téléchargement du PDF
    SaveFile.saveAndLaunchFile(bytes, 'statistiques_${year.toString()}.pdf');
  }

  void initializeVariables() {
    //Initialisation de toutes les variables nécessaires
    users = returnYearUserList();
    averageAge = calculateAverageAge(
        users,
        ageMin,
        ageMax,
        ageMinMale,
        ageMaxMale,
        ageMinFemale,
        ageMaxFemale,
        averageAgeMale,
        averageAgeFemale);
    percentageMale = returnPercentageOfMale(users, numberOfMales);
    totalConnexionNumber = returnTotalConnectionNumber(users);
    totalConnexionHours =
        formatConnectionTime(calculateNumberOfHoursConnection(users));
    userNumber = users.length;
    userNumberString = userNumber.toString();

    //Récupération de l'année en cours
    DateTime now = DateTime.now();
    year = now.year;
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
