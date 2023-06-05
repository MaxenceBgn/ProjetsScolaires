import 'package:flutter/material.dart';
import 'list_item.dart';

class ListProviderItem extends ChangeNotifier {
  int index = 0;
  List<ListItem> listColors = [];
  List<ListItem> listItems = [];

  ListProviderItem() {
    ListItem color1 = ListItem(Colors.red[900] ?? Colors.red, "Rouge");
    ListItem color2 =
        ListItem(Colors.redAccent[300] ?? Colors.redAccent, "Rouge pastel");
    ListItem color3 = ListItem(Colors.pink, "Rose");
    ListItem color4 = ListItem(Colors.purple, "Violet");
    ListItem color5 = ListItem(Colors.purple[900] ?? Colors.purple, "Lavande");
    ListItem color6 = ListItem(Colors.blue[900] ?? Colors.blue, "Océan");
    ListItem color7 = ListItem(Colors.blue, "Bleu");
    ListItem color8 = ListItem(Colors.blue[200] ?? Colors.blue, "Côton");
    ListItem color9 = ListItem(Colors.green[200] ?? Colors.green, "Pomme");
    ListItem color10 = ListItem(Colors.green, "Vert");
    ListItem color11 = ListItem(Colors.green[800] ?? Colors.green, "Pelouse");
    ListItem color12 = ListItem(Colors.yellow[900] ?? Colors.yellow, "Indien");
    ListItem color13 = ListItem(Colors.yellow[600] ?? Colors.yellow, "Sable");
    ListItem color14 = ListItem(Colors.yellow[100] ?? Colors.yellow, "Oeuf");

    listColors = [
      color1,
      color2,
      color3,
      color4,
      color5,
      color6,
      color7,
      color8,
      color9,
      color10,
      color11,
      color12,
      color13,
      color14,
    ];
  }

  void addItem() {
    if (index < listColors.length) {
      listItems.add(listColors[index]);
      index++;
    }
    notifyListeners();
  }
}
