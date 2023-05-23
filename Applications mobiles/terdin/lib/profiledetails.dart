import 'package:flutter/material.dart';
import '../models/bachelor.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<ProfileDetailsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProfileDetailsPage> {
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
        child: Image.asset("assets/images/man-1.png"),
      ),
    );
  }
}
