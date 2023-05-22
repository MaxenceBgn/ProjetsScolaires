import 'dart:math';

enum Gender {
  Homme,
  Femme,
  NonBinaire,
}

List<String> womenFirstNames = [
  "Anna",
  "Sylvie",
  "Stéphanie",
  "Simone",
  "Emma",
  "Dorine",
  "Lila",
  "Loline",
  "Irina",
  "Lali"
];

List<String> menFirstNames = [
  "Germain",
  "Steph",
  "Arthur",
  "Léo",
  "Maxence",
  "Pascal",
  "Léon",
  "Mike",
  "Cyprien",
  "Aiden"
];

List<String> nobinaryFirstNames = [
  "Alex",
  "Taylor",
  "Jordan",
  "Casey",
  "Charlie",
  "Finley",
  "Jamie",
  "Peyton",
  "Riley",
  "Rowan"
];

List<String> lastnames = [
  "Martin",
  "Lefebvre",
  "Thomas",
  "Petit",
  "Robert",
  "Richard",
  "Durand",
  "Dubois",
  "Simon",
  "Laurent",
  "Michel",
  "Garcia",
  "Bertrand",
  "Leroux",
  "Vincent",
  "Fournier",
  "Rousseau",
  "Dupont",
  "Gauthier",
  "Mercier",
  "Dupuis",
  "Faure",
  "Lambert",
  "André",
  "Girard",
  "David",
  "Morel",
];

class Bachelor {
  //Person parameters -----------------------------------------------------------------------------------------

  static int returnRandomNumber(int numberMax) {
    Random random = Random();
    return random.nextInt(numberMax);
  }

  static String generateFirstName(Gender gender, List<String> menFirstnames,
      List<String> womenFirstnames, List<String> noBinaryFirstnames) {
    if (gender == Gender.Homme) {
      return menFirstnames[returnRandomNumber(9)];
    } else if (gender == Gender.Femme) {
      return womenFirstnames[returnRandomNumber(9)];
    } else {
      return noBinaryFirstnames[returnRandomNumber(9)];
    }
  }

  static String generateLastname(List<String> lastnames) {
    return lastnames[returnRandomNumber(lastnames.length - 1)];
  }

  static Gender generateGender() {
    int randomNumber = returnRandomNumber(2);
    if (randomNumber == 0) {
      return Gender.NonBinaire;
    } else if (randomNumber == 1) {
      return Gender.Homme;
    } else {
      return Gender.Femme;
    }
  }

  static int generateAge() {
    Random random = new Random();
    return random.nextInt(43) + 18;
  }

  static String generateAvatar(Gender gender, int age) {
    if (gender == Gender.Homme) {
      if (age < 22) {
        return "assets/images/man-9.png";
      } else if (age < 30) {
        return "assets/images/man-12.png";
      } else if (age < 35) {
        return "assets/images/man-14.png";
      } else if (age < 40) {
        return "assets/images/man-13.png";
      } else if (age < 50) {
        return "assets/images/man-1.png";
      } else {
        return "assets/images/man-2.png";
      }
    } else {
      if (age < 22) {
        return "assets/images/woman-1.png";
      } else if (age < 30) {
        return "assets/images/woman-2.png";
      } else if (age < 35) {
        return "assets/images/woman-14.png";
      } else if (age < 40) {
        return "assets/images/woman-10.png";
      } else if (age < 50) {
        return "assets/images/woman-3.png";
      } else {
        return "assets/images/woman-8.png";
      }
    }
  }

  static bool generateActivity() {
    int r = returnRandomNumber(2);
    if (r == 1) {
      return false;
    } else {
      return true;
    }
  }

  //Main ------------------------------------------------------------------------------------------------------------------------------

  static List<Bachelor> generateRandomProfiles(int count) {
    final profiles = <Bachelor>[];

    for (int i = 0; i < count; i++) {
      final profile = Bachelor();

      profile.gender = generateGender();
      profile.firstname = generateFirstName(
          profile.gender, menFirstNames, womenFirstNames, nobinaryFirstNames);
      profile.lastname = generateLastname(lastnames);
      profile.age = generateAge();
      profile.avatar = generateAvatar(profile.gender, profile.age);
      profile.isOnline = generateActivity();
      profiles.add(profile);
    }

    return profiles;
  }

  String firstname = "";
  String lastname = "";
  Gender gender = Gender.Homme;
  String avatar = "";
  int age = 0;
  bool isOnline = false;
}
