import 'package:flutter/material.dart';
import 'package:terdin/profiledetails.dart';
import '../models/bachelor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _profiles = Bachelor.generateRandomProfiles(30);

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
      body: Center(
        child: SingleChildScrollView(
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
                          builder: (context) => ProfileDetailsPage(
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
                          Image.asset(getOnlineStatus(index, _profiles)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
