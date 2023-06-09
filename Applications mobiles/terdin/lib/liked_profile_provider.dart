import 'package:flutter/material.dart';
import '../models/bachelor.dart';

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
