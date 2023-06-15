import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:uuid/uuid_util.dart';
import 'todolistApp.dart';
import 'package:uuid/uuid.dart';

void main() {
  var uuid = const Uuid(options: {'grng': UuidUtil.cryptoRNG});

// Generate a v4 (random) id that will use cryptRNG for its rng function
  uuid.v4();

  Task task1 = Task();
  task1.title = "Signer dossier de paiement";
  task1.content =
      "Signer le dossier de paiement pour le compte de Nathalie Obringer";
  task1.userId = "utilisateur1";
  task1.deadLine = DateTime.now().add(const Duration(days: 2));
  task1.category = "Administration";
  task1.priority = 2;
  task1.id = uuid.v4();

  Task task2 = Task();
  task2.title = "Préparer rapport de vente";
  task2.content = "Préparer un rapport détaillé sur les ventes du mois dernier";
  task2.userId = "utilisateur2";
  task2.deadLine = DateTime.now().add(const Duration(days: 5));
  task2.category = "Ventes";
  task2.priority = 1;
  task2.id = uuid.v4();

  Task task3 = Task();
  task3.title = "Organiser réunion d'équipe";
  task3.content =
      "Planifier et organiser une réunion d'équipe pour discuter des prochains projets";
  task3.userId = "utilisateur3";
  task3.deadLine = DateTime.now().add(const Duration(days: 3));
  task3.category = "Réunions";
  task3.priority = 3;
  task3.id = uuid.v4();

  Task task4 = Task();
  task4.title = "Tester l'application mobile";
  task4.content =
      "Effectuer des tests approfondis de l'application mobile avant le lancement";
  task4.userId = "utilisateur1";
  task4.deadLine = DateTime.now().add(const Duration(days: 7));
  task4.category = "Développement";
  task4.priority = 2;
  task4.id = uuid.v4();

  List<Task> tasks = [task1, task2, task3, task4];

  runApp(TodolistApp(tasks: tasks));
}
