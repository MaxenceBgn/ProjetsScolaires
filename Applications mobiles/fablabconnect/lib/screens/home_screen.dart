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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

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
      return const Color.fromARGB(255, 117, 122, 115);
    } else {
      return const Color.fromARGB(255, 141, 141, 140);
    }
  }

  void updateUser(String userId, String newFirstName, String newLastName) {
    setState(() {
      final index = users.indexWhere((user) => user['ID'] == userId);
      final updatedUser = {
        ...users[index],
        'Prenom': newFirstName,
        'Nom': newLastName,
      };
      users[index] = updatedUser;
    });
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
                  builder: (context) => ProfileDetailsScreen(
                    profile: user,
                    currentFirstName: user['Prenom'],
                    currentLastName: user['Nom'],
                    updateUser: updateUser,
                  ),
                ),
              ).then((result) {
                if (result != null) {
                  String newFirstName = result['newFirstName'];
                  String newLastName = result['newLastName'];
                  if (newFirstName != null && newLastName != null) {
                    updateUser(user['ID'], newFirstName, newLastName);
                  }
                }
              });
            },
            onHover: (value) {
              setState(() {
                isHovered = value;
              });
            },
            child: Container(
              color: isHovered ? Colors.grey[300] : getTileColor(index, users),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${user['Prenom']} ${user['Nom']}',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
