import 'package:flutter/material.dart';
import 'liked_profile_provider.dart';
import '../models/bachelor.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BachelorDetailsPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var likedBachelors;

  BachelorDetailsPage({
    super.key,
    required this.title,
    required this.selectedPerson,
  });

  final String title;
  final Bachelor? selectedPerson;

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailsPageState createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<BachelorDetailsPage> {
  bool liked = false;
  Icon likeIcon = Icon(
    Icons.favorite,
    color: Colors.grey[600],
  );
  Color alertColor = const Color.fromARGB(255, 55, 143, 58);
  String alertText = "Vous avez liké ce profil";

  String getOnlineStatus(Bachelor person) {
    if (person.isOnline == true) {
      return "assets/images/online.png";
    } else {
      return "assets/images/offline.png";
    }
  }

  void likeProfile() {
    final likedProfileProvider =
        Provider.of<LikedProfileProvider>(context, listen: false);

    if (!widget.selectedPerson!.isLiked) {
      likedProfileProvider.likeProfile(widget.selectedPerson!);
      alertColor = const Color.fromARGB(255, 55, 143, 58);
      alertText = "Vous avez liké ce profil";
      _displayAlert("Vous avez liké ce profil");
    } else {
      likedProfileProvider.unlikeProfile(widget.selectedPerson!);
      alertColor = const Color.fromARGB(255, 134, 5, 5);
      alertText = "Vous n'aimez plus ce profil";
      _displayAlert(alertText);
    }
  }

  void _displayAlert(String alertText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(alertText),
        duration: const Duration(seconds: 1),
        backgroundColor: alertColor,
      ),
    );
  }

  String _displayGender(Bachelor person) {
    if (person.gender == Gender.Homme) {
      return "Homme";
    } else if (person.gender == Gender.Femme) {
      return "Femme";
    } else {
      return "Non binaire";
    }
  }

  Icon _displayFavoriteIcon(Bachelor profile) {
    if (!profile.hasBeenLiked && !profile.isLiked) {
      return const Icon(Icons.favorite,
          color: Color.fromARGB(255, 163, 163, 163));
    } else {
      if (profile.isLiked) {
        return Icon(Icons.favorite, color: Colors.red[900]);
      } else {
        return const Icon(Icons.heart_broken_sharp,
            color: Color.fromARGB(255, 163, 163, 163));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedPerson = widget.selectedPerson;
    return Scaffold(
      backgroundColor: const Color.fromARGB(158, 173, 167, 167),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontFamily: 'Lato'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/coeur.png',
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Consumer(builder: (context, profileProvider, _) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 65, 65, 65),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      selectedPerson!.avatar,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 35),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${selectedPerson.firstname} ${selectedPerson.lastname}",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[50]),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            getOnlineStatus(selectedPerson),
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${selectedPerson.age} ans",
                      style: TextStyle(fontSize: 40, color: Colors.amber[50]),
                    ),
                    Text(
                      selectedPerson.city,
                      style: TextStyle(fontSize: 40, color: Colors.amber[50]),
                    ),
                    Consumer<LikedProfileProvider>(
                      builder: (context, likedProfileProvider, _) {
                        return IconButton(
                            onPressed: () => likeProfile(),
                            icon: _displayFavoriteIcon(widget.selectedPerson!));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(158, 173, 167, 167),
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Description : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Text(
                            selectedPerson.description,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Centres d'intérêts : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Text(
                            selectedPerson.interests,
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Genre : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          _displayGender(selectedPerson),
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Statut : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          selectedPerson.statut,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Sexualité : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          selectedPerson.sexuality,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ]),
                ),
              )
            ],
          );
        })),
      ),
    );
  }
}
