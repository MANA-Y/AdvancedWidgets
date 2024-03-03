import 'package:flutter/material.dart';

class Task {
  String title;
  bool completed;

  Task({
    required this.title,
    this.completed = false,
  });
}

class TaskUI extends StatefulWidget {
  const TaskUI({super.key});

  @override
  State<TaskUI> createState() => _TaskUIState();
}

class _TaskUIState extends State<TaskUI> {
  final List<Task> tasks = [];

  void _add() {
    setState(() {
      tasks.add(Task(
        title: 'Задача ${tasks.length + 1}',
      ));
    });
  }

  void _remove(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return Dismissible(
            key: ObjectKey(task),
            onDismissed: (direction) {
              _remove(task);
            },
            background: Container(
              color: Colors.red,
              child: const Icon(Icons.restore_from_trash),
            ),
            child: CheckboxListTile(
              value: task.completed,
              onChanged: (bool? newValue) {
                setState(() {
                  task.completed = newValue!;
                });
              },
              title: Text(task.title),
            ),
          );
        },
        onReorder: _onReorder,
        footer: ElevatedButton(
          onPressed: _add,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final Task item = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, item);

    setState(() {});
  }
}
