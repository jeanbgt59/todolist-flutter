class Todo {
  final String id;
  String title;
  bool isDone;
  DateTime? dueDate;
  String? description;
  DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    this.isDone = false,
    this.dueDate,
    this.description,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convertit un Todo en Map pour le stockage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'dueDate': dueDate?.toIso8601String(),
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Crée un Todo à partir d'une Map (pour la lecture depuis le stockage)
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'],
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
      description: map['description'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // Crée une copie d'un Todo avec possibilité de modifier certains champs
  Todo copyWith({
    String? title,
    bool? isDone,
    DateTime? dueDate,
    String? description,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      dueDate: dueDate ?? this.dueDate,
      description: description ?? this.description,
      createdAt: createdAt,
    );
  }
}
