import 'package:flutter/material.dart';
import '../models/bachelor.dart';
import 'package:provider/provider.dart';
import 'bachelorDetails.dart';

class LikedProfileProvider extends ChangeNotifier {
  List<Bachelor> likedProfiles = [];

  void likeProfile(Bachelor profile) {
    profile.isLiked = true;
    profile.hasBeenLiked = true;
    likedProfiles.add(profile);
    notifyListeners();
  }

  void unlikeProfile(Bachelor profile) {
    profile.isLiked = false;
    likedProfiles.remove(profile);
    notifyListeners();
  }

  bool isProfileLiked(Bachelor profile) {
    return profile.isLiked;
  }
}

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

class LikedProfilesPage extends StatefulWidget {
  final String title;
  const LikedProfilesPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LikedProfilesPageState createState() => _LikedProfilesPageState();
}

class _LikedProfilesPageState extends State<LikedProfilesPage> {
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/coeur.png',
                  width: 35,
                  height: 35,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<LikedProfileProvider>(
          builder: (context, profileProvider, _) {
            List<Bachelor> likedProfiles = profileProvider.likedProfiles;

            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: likedProfiles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Bachelor selectedPerson = likedProfiles[index];
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
                        tileColor: getTileColor(index, likedProfiles),
                        textColor: Colors.white,
                        leading: Image.asset(likedProfiles[index].avatar),
                        title: Row(
                          children: [
                            Text(
                                "${likedProfiles[index].firstname} ${likedProfiles[index].age} ans"),
                            const SizedBox(width: 10),
                            Image.asset(
                              getOnlineStatus(index, likedProfiles),
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
            );
          },
        ),
      ),
    );
  }
}
