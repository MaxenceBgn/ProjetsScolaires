import 'package:flutter/material.dart';
import 'package:terdin/bachelorDetails.dart';
import '../models/bachelor.dart';

class BachelorPreview extends StatefulWidget {
  const BachelorPreview({super.key, required this.title});

  final String title;

  @override
  State<BachelorPreview> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BachelorPreview> {
  final _profiles = Bachelor.generateRandomProfiles(30);
  List<Bachelor> likedBachelors = [];

  Color? getTileColor(int index, List<Bachelor> bachelors) {
    if (bachelors[index].isOnline == true) {
      return Colors.grey;
    } else {
      return Colors.grey[700];
    }
  }

  String getOnlineStatus(int index, List<Bachelor> bachelors) {
    if (bachelors[index].isOnline == true) {
      return "assets/images/online.png";
    } else {
      return "assets/images/offline.png";
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _profiles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Bachelor selectedPerson = _profiles[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BachelorDetailsPage(
                          title: 'Détails du profil',
                          selectedPerson: selectedPerson,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: getTileColor(index, _profiles),
                    textColor: Colors.white,
                    leading: Image.asset(_profiles[index].avatar),
                    title: Row(
                      children: [
                        Text(
                            "${_profiles[index].firstname} ${_profiles[index].age} ans"),
                        const SizedBox(width: 10),
                        Image.asset(
                          getOnlineStatus(index, _profiles),
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}