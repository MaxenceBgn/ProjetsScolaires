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

//Retourne la liste de toutes les valeurs d'âge
List<int> calculateAverageAge(
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

  List<int> numbersToReturn = [
    ageMin,
    ageMax,
    ageMinMale,
    ageMaxMale,
    ageMinFemale,
    ageMaxFemale,
    average.toInt(),
    averageAgeMale.toInt(),
    averageAgeFemale.toInt()
  ];
  return numbersToReturn;
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

//Calcule le nombre d'hommes
int returnNumberOfMale(List<dynamic> users, int numberOfMales) {
  for (var i = 0; i < users.length; i++) {
    if (users[i]['Sexe'] == "H") {
      numberOfMales++;
    }
  }
  return numberOfMales;
}

//Calcule le pourcentage d'hommes
double returnPercentageOfMales(List<dynamic> users, numberOfMales) {
  return (numberOfMales / users.length) * 100;
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

int calculateNumberOfRegular(List<dynamic> users) {
  int numberOfRegular = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]['Regulier'] != 0) {
      numberOfRegular++;
    }
  }
  return numberOfRegular;
}

int returnNumberOfConnexions(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    numberOfConnexions += users[i]['NombreTotalConnexions'];
  }
  return numberOfConnexions.toInt();
}

/////////////////////////////////////////Statistiques de connexion

//Moyennes de connexion totales
int returnAverageConnexions(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    numberOfConnexions += users[i]['NombreTotalConnexions'];
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

int returnAverageConnexionsOfRegulars(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]["Regulier"] != 0) {
      numberOfConnexions += users[i]['NombreTotalConnexions'];
    }
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

int returnAverageConnexionsOfPonctuals(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]["Regulier"] == 0) {
      numberOfConnexions += users[i]['NombreTotalConnexions'];
    }
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

//Moyennes de connexions annuelles
int returnAverageConnexionsYear(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    numberOfConnexions += users[i]['NombreConnexionsDerniereAnnee'];
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

int returnAverageConnexionsOfRegularsYear(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]["Regulier"] != 0) {
      numberOfConnexions += users[i]['NombreConnexionsDerniereAnnee'];
    }
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

int returnAverageConnexionsOfPonctualsYear(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]["Regulier"] == 0) {
      numberOfConnexions += users[i]['NombreConnexionsDerniereAnnee'];
    }
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

//Moyennes de connexions mensuelles
int returnAverageConnexionsMonth(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    numberOfConnexions += users[i]['NombreConnexionsDernierMois'];
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

int returnAverageConnexionsOfRegularsMonth(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]["Regulier"] != 0) {
      numberOfConnexions += users[i]['NombreConnexionsDernierMois'];
    }
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}

int returnAverageConnexionsOfPonctualsMonth(List<dynamic> users) {
  num numberOfConnexions = 0;
  for (var i = 0; i < users.length; i++) {
    if (users[i]["Regulier"] == 0) {
      numberOfConnexions += users[i]['NombreConnexionsDernierMois'];
    }
  }
  numberOfConnexions = numberOfConnexions / users.length;
  return numberOfConnexions.toInt();
}
