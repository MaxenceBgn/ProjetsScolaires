import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = []; // Liste pour stocker les utilisateurs récupérés

  @override
  void initState() {
    super.initState();
    fetchData(); // Appel de la fonction pour récupérer les données au chargement de l'écran
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/utilisateurs/distinct'));
    if (response.statusCode == 200) {
      // Vérifiez si la requête a réussi (code de statut 200)
      final jsonData = jsonDecode(response.body);
      setState(() {
        users =
            jsonData; // Met à jour la liste des utilisateurs avec les données récupérées
      });
    } else {
      // Gère les erreurs de requête en conséquence
      print(
          'Erreur lors de la récupération des données : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Liste des utilisateurs"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return ListTile(
            title: Text(user['Nom']),
            subtitle: Text(user['Prenom']),
          );
        },
      ),
    );
  }
}
