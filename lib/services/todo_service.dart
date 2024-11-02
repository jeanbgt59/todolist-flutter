import '../models/todo.dart';

class TodoService {
  // Simulons une base de données avec une liste en mémoire
  final List<Todo> _todos = [];

  // Obtenir toutes les tâches
  List<Todo> getAllTodos() {
    return List.unmodifiable(_todos);
  }

  // Ajouter une nouvelle tâche
  void addTodo(String title, {String? description, DateTime? dueDate}) {
    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      dueDate: dueDate,
    );
    _todos.add(todo);
  }

  // Mettre à jour une tâche
  void updateTodo(String id,
      {String? title, bool? isDone, String? description, DateTime? dueDate}) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        title: title,
        isDone: isDone,
        description: description,
        dueDate: dueDate,
      );
    }
  }

  // Supprimer une tâche
  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
  }

  // Marquer une tâche comme terminée ou non
  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(isDone: !_todos[index].isDone);
    }
  }
}
