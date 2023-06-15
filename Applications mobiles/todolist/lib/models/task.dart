class Task {
  String content = "";
  String? id = "";
  String userId = "";
  bool? done = false;
  DateTime createdAt = DateTime.now();
  DateTime? updatedAt = DateTime.now();
  DateTime? deadLine = DateTime.now();
  String? category = "";
  int? priority = 1;
}
