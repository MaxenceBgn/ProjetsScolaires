import 'package:flutter/material.dart';
import '../models/bachelor.dart';

class ProfileDetailsPage extends StatefulWidget {
  ProfileDetailsPage({required this.title, required this.selectedPerson});

  final String title;
  final Bachelor? selectedPerson;

  @override
  _ProfileDetailsPageState createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  String getOnlineStatus(Bachelor person) {
    if (person.isOnline == true) {
      return "assets/images/online.png";
    } else {
      return "assets/images/offline.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedPerson = widget.selectedPerson;
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              selectedPerson!.avatar,
              width: 200,
              height: 200,
            ),
            Row(
              children: [
                Text(
                  "${selectedPerson.firstname} ${selectedPerson.lastname}",
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  getOnlineStatus(selectedPerson),
                  width: 30,
                  height: 30,
                )
              ],
            ),
            Text(
              "${selectedPerson.age} ans",
              style: const TextStyle(fontSize: 40),
            ),
            const Text(
              "Toulouse",
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const Text(
                  "Centres d'intérêts : ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Flexible(
                  child: Text(
                    selectedPerson.interests,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),

            // Autres éléments que vous souhaitez ajouter
          ],
        ),
      ),
    );
  }
}
