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

List<String> interestsList = [
  'Cuisine',
  'Rencontre',
  'Voyage',
  'Musculation',
  'Sortir',
  'Sport',
  'Courir',
  'Voitures',
  'Animaux',
  'Mangas',
  'JeuxVideos',
  'Nourriture',
  'Cinema',
  'Litterature',
  'Aventure',
  'Etudes',
  'Deguisement',
  'Evenements',
  'Visite',
  'Artisanat',
  'Vente',
  'Commerce',
  'Promenade',
  'Randonnee',
  'Aviation',
];

List<String> cities = [
  "Metz",
  "Courcelles-Chaussy",
  "Faulquemont",
  "Stuckange",
  "Mondelange",
  "Marsilly",
  "Mécleuves",
  "Corny-sur-Moselle",
  "Goin",
  "Sérémange-Erzange",
  "Sarreguemines",
  "Sarralbe",
  "Saint-Louis",
  "Bitche",
  "Montbronn",
  "Volmunster",
  "Alsting",
  "Silly-sur-Nied",
  "Saint-Avold",
  "Stiring-Wendel",
  "Forbach",
  "Folshviller"
];

List<String> statuts = [
  "Célibataire",
  "En couple",
  "Marié",
  "En relation libre",
  "Ne souhaite pas le communiquer"
];

List<String> sexualities = [
  "Hétéro",
  "Bi",
  "Gay",
  "Pansexuel",
  "Asexuel",
  "Démisexuel",
  "Hétéroflexible",
  "Homoflexible",
  "Skoliosexuel",
  "Autosexuel"
];

List<String> descriptions = [
  "Aventurier passionné cherchant un partenaire pour explorer le monde ensemble.",
  "Amateur de café, cinéphile et amoureux des animaux. Recherche connexion authentique.",
  "Passionné de musique et de danse, à la recherche d'un partenaire pour enflammer la piste.",
  "Esprit créatif avec une passion pour l'art et la photographie. À la recherche d'inspiration.",
  "Amoureux de la nature et des randonnées en montagne. À la recherche d'une âme sœur en plein air.",
  "Globe-trotter à la recherche d'un compagnon de voyage pour créer des souvenirs inoubliables.",
  "Amateur de gastronomie cherchant un partenaire pour découvrir de délicieux restaurants.",
  "Passionné de fitness et de mode de vie sain. À la recherche d'un partenaire motivé.",
  "Fan de jeux vidéo et de soirées jeux de société. Recherche quelqu'un pour défier et s'amuser.",
  "Adepte du yoga et de la méditation. Cherche un esprit tranquille pour une connexion profonde.",
  "Amateur de livres et de discussions intellectuelles. À la recherche d'une connexion intellectuelle.",
  "Fan de concerts et de festivals. Recherche une âme sœur musicale pour partager des moments forts.",
  "Amoureux des animaux et bénévole dans un refuge. À la recherche d'un partenaire compatissant.",
  "Passionné de sports extrêmes et d'adrénaline. Recherche un compagnon d'aventure intrépide.",
  "Amateur de comédies et de rires. Cherche quelqu'un pour partager des moments de pure joie."
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

  static String generateInterestsCenter() {
    List<String> listToReturn = [];
    String interest1 = findAInterestCenter();
    String interest2 = findAInterestCenter();
    String interest3 = findAInterestCenter();
    String interest4 = findAInterestCenter();
    String interest5 = findAInterestCenter();

    listToReturn.add(interest1);
    listToReturn.add(interest2);
    listToReturn.add(interest3);
    listToReturn.add(interest4);
    listToReturn.add(interest5);

    return listToReturn.join(", ");
  }

  static String findAInterestCenter() {
    int number = returnRandomNumber(interestsList.length);
    return interestsList[number];
  }

  static String generateCity() {
    int number = returnRandomNumber(cities.length);
    return cities[number];
  }

  static String generateStatus() {
    int number = returnRandomNumber(statuts.length);
    return statuts[number];
  }

  static String generateSexuality() {
    int number = returnRandomNumber(statuts.length);
    return sexualities[number];
  }

  static String generateDescription() {
    int number = returnRandomNumber(descriptions.length);
    return descriptions[number];
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
      profile.interests = generateInterestsCenter();
      profile.city = generateCity();
      profile.statut = generateStatus();
      profile.sexuality = generateSexuality();
      profile.description = generateDescription();
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
  String interests = "";
  String city = "";
  String statut = "";
  String sexuality = "";
  String description = "";
  bool isLiked = false;
}
