import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terdin/bachelorDetails.dart';
import 'package:terdin/liked_profile_provider.dart';
import '../models/bachelor.dart';

class BachelorPreview extends StatefulWidget {
  const BachelorPreview({super.key, required this.title});

  final String title;

  @override
  State<BachelorPreview> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BachelorPreview> {
  final _profiles = Bachelor.generateRandomProfiles(30);
  List<bool> checkboxStates = [true, true, true];

  Color? getTileColor(int index, List<Bachelor> bachelors) {
    if (bachelors[index].isLiked) {
      return const Color.fromARGB(255, 165, 123, 6);
    } else {
      if (bachelors[index].isOnline == true) {
        return Colors.grey;
      } else {
        return Colors.grey[700];
      }
    }
  }

  void _dislikeProfile(Bachelor bachelorDisliked, List<Bachelor> bachelors) {
    if (bachelorDisliked.isLiked) {
      LikedProfileProvider profileProvider =
          Provider.of<LikedProfileProvider>(context, listen: false);
      profileProvider.unlikeProfile(bachelorDisliked);
    }

    bachelors.remove(bachelorDisliked);
    setState(() {});
  }

  String getOnlineStatus(int index, List<Bachelor> bachelors) {
    if (bachelors[index].isOnline == true) {
      return "assets/images/online.png";
    } else {
      return "assets/images/offline.png";
    }
  }

  List<Bachelor> filterProfiles() {
    List<Bachelor> filteredProfiles = [];

    for (Bachelor profile in _profiles) {
      if (checkboxStates[0] && profile.gender == Gender.Homme) {
        filteredProfiles.add(profile);
      } else if (checkboxStates[1] && profile.gender == Gender.Femme) {
        filteredProfiles.add(profile);
      } else if (checkboxStates[2] && profile.gender == Gender.NonBinaire) {
        filteredProfiles.add(profile);
      }
    }

    return filteredProfiles;
  }

  @override
  Widget build(BuildContext context) {
    List<Bachelor> filteredProfiles = filterProfiles();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontFamily: 'Lato'),
        ),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()), // Espace vide à gauche
            Center(
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LikedProfilesPage(
                        title: 'Mes profils likés',
                      ),
                    ),
                  );
                },
              ),
            ),
            const Expanded(child: SizedBox()), // Espace vide à droite
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Homme"),
                Checkbox(
                  value: checkboxStates[0],
                  onChanged: (value) {
                    setState(() {
                      checkboxStates[0] = value!;
                    });
                  },
                ),
                const Text("Femme"),
                Checkbox(
                  value: checkboxStates[1],
                  onChanged: (value) {
                    setState(() {
                      checkboxStates[1] = value!;
                    });
                  },
                ),
                const Text("Non binaire"),
                Checkbox(
                  value: checkboxStates[2],
                  onChanged: (value) {
                    setState(() {
                      checkboxStates[2] = value!;
                    });
                  },
                ),
              ],
            ),
            Consumer<LikedProfileProvider>(
              builder: (context, profileProvider, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredProfiles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Bachelor selectedPerson = filteredProfiles[index];
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
                        tileColor: getTileColor(index, filteredProfiles),
                        textColor: Colors.white,
                        leading: Image.asset(filteredProfiles[index].avatar),
                        title: Row(
                          children: [
                            Text(
                                "${filteredProfiles[index].firstname} ${filteredProfiles[index].age} ans"),
                            const SizedBox(width: 10),
                            Image.asset(
                              getOnlineStatus(index, filteredProfiles),
                              width: 10,
                              height: 10,
                            ),
                            IconButton(
                                onPressed: () => _dislikeProfile(
                                    filteredProfiles[index], _profiles),
                                icon: const Icon(Icons.delete_forever))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
