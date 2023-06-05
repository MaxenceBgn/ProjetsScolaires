import 'package:flutter/material.dart';
import 'package:terdin/models/bachelor.dart';

class BachelorsLikedCollection extends ChangeNotifier {
  final List<Bachelor> bachelorsLiked = [];

  void addLikedBachelor(Bachelor selectedPerson) {
    bachelorsLiked.add(selectedPerson);
    notifyListeners();
  }
}
