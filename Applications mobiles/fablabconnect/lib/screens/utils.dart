import 'package:intl/intl.dart';

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

//Calcule la moyenne d'âge des utilisateurs et initialisation des variables d'âge
int calculateAverageAge(
    List<dynamic> users,
    int ageMin,
    int ageMax,
    int ageMinMale,
    int ageMaxMale,
    int ageMinFemale,
    int ageMaxFemale,
    num averageAgeMale,
    num averageAgeFemale) {
  List<int> ages = [];
  List<int> agesFemale = [];
  List<int> agesMale = [];
  for (var i = 0; i < users.length; i++) {
    ages.add(users[i]['Age']);
    //Tous les utilisateurs
    if (users[i]['Age'] < ageMin) {
      ageMin = users[i]['Age'];
    }
    if (users[i]['Age'] > ageMax) {
      ageMax = users[i]['Age'];
    }
    if (users[i]['Sexe'] == 'H') {
      //Utilisateurs hommes
      if (users[i]['Age'] < ageMinMale) {
        ageMinMale = users[i]['Age'];
      }
      if (users[i]['Age'] > ageMaxMale) {
        ageMaxMale = users[i]['Age'];
      }
      agesMale.add(users[i]['Age']);
    } else {
      //Utilisateurs femmes
      if (users[i]['Age'] < ageMinFemale) {
        ageMinFemale = users[i]['Age'];
      }
      if (users[i]['Age'] > ageMaxFemale) {
        ageMaxFemale = users[i]['Age'];
      }
      agesFemale.add(users[i]['Age']);
    }
  }

  double sum = ages.isNotEmpty
      ? ages.reduce((value, element) => value + element).toDouble()
      : 0.0;
  double average = ages.isNotEmpty ? sum / ages.length : 0.0;

  sum = agesMale.isNotEmpty
      ? agesMale.reduce((value, element) => value + element).toDouble()
      : 0.0;
  averageAgeMale = agesMale.isNotEmpty ? sum ~/ agesMale.length : 0;

  sum = agesFemale.isNotEmpty
      ? agesFemale.reduce((value, element) => value + element).toDouble()
      : 0.0;
  averageAgeFemale = agesFemale.isNotEmpty ? sum ~/ agesFemale.length : 0;

  return average.toInt();
}

String returnMonthString(int monthInt) {
  String month = "";
  switch (monthInt) {
    case 1:
      month = "Janvier";
      break;
    case 2:
      month = "Février";
      break;
    case 3:
      month = "Mars";
      break;
    case 4:
      month = "Avril";
      break;
    case 5:
      month = "Mai";
      break;
    case 6:
      month = "Juin";
      break;
    case 7:
      month = "Juillet";
      break;
    case 8:
      month = "Août";
      break;
    case 9:
      month = "Septembre";
      break;
    case 10:
      month = "Octobre";
      break;
    case 11:
      month = "Novembre";
      break;
    case 12:
      month = "Décembre";
      break;
    default:
      month = "Erreur : aucun mois n'a pu être défini.";
  }
  return month;
}

//Calcule le pourcentage d'hommes
int returnPercentageOfMale(List<dynamic> users, int numberOfMales) {
  double percent = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]['Sexe'] == "H") {
      numberOfMales++;
    }
  }
  percent = (numberOfMales / users.length) * 100;
  return percent.toInt();
}

int returnTotalConnectionNumber(List<dynamic> users) {
  num connectionUserNumber = 0;
  for (var i = 0; i < users.length; i++) {
    connectionUserNumber += users[i]['NombreTotalConnexions'];
  }
  return connectionUserNumber.toInt();
}

double calculateNumberOfHoursConnection(List<dynamic> users) {
  double connectionHours = 0;
  for (var i = 0; i < users.length; i++) {
    for (var i = 0; i < users.length; i++) {
      connectionHours += users[i]['TempsConnexionDernierMois'];
    }
  }
  return connectionHours;
}
