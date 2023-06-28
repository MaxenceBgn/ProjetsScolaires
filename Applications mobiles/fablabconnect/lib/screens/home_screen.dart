import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/utilisateurs/distinct'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        users = jsonData;
      });
    } else {
      print(
          'Erreur lors de la récupération des données : ${response.statusCode}');
    }
  }

  Color? getTileColor(int index, List<dynamic> users) {
    if (index % 2 == 0) {
      return Color.fromARGB(255, 117, 122, 115);
    } else {
      return Color.fromARGB(255, 141, 141, 140);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF008E00),
                Color(0xFFFFD700),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: const Text(
          "Liste des utilisateurs",
          style: TextStyle(
            color: Color.fromARGB(255, 253, 243, 243),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          bool isHovered = false;

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileDetailsScreen(profile: user),
                ),
              );
            },
            onHover: (value) {
              setState(() {
                isHovered = value;
              });
            },
            child: ListTile(
              tileColor: isHovered
                  // ignore: dead_code
                  ? const Color.fromARGB(255, 35, 95, 38)
                  : getTileColor(index, users),
              title: Text(user['Prenom']),
              subtitle: Text(user['Nom']),
            ),
          );
        },
      ),
    );
  }
}
