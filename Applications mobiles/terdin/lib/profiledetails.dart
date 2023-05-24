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
  bool liked = false;
  Icon likeIcon = Icon(
    Icons.heart_broken_sharp,
    color: Colors.grey[600],
  );

  String getOnlineStatus(Bachelor person) {
    if (person.isOnline == true) {
      return "assets/images/online.png";
    } else {
      return "assets/images/offline.png";
    }
  }

  void likeProfile() {
    if (liked == false) {
      setState(() {
        liked = true;
        likeIcon = Icon(
          Icons.favorite,
          color: Colors.red[900],
        );
      });
    } else {
      setState(() {
        liked = false;
        likeIcon = Icon(
          Icons.heart_broken_sharp,
          color: Colors.grey[600],
        );
      });
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 190, 21, 21),
                padding: EdgeInsets.all(20),
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
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Image.asset(getOnlineStatus(selectedPerson)),
                        ],
                      ),
                    ),
                    Text(
                      "${selectedPerson.age} ans",
                      style: const TextStyle(fontSize: 40),
                    ),
                    Text(
                      selectedPerson.city,
                      style: const TextStyle(fontSize: 35),
                    ),
                    IconButton(onPressed: likeProfile, icon: likeIcon)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Centres d'intérêts : ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Text(
                      selectedPerson.interests,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
