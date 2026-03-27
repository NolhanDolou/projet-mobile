import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/taskRest.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.taskRest});

  // Declare a field that holds the Todo.
  final TaskRest taskRest;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(title: Text(taskRest.title)),
      body: Column(
        children : [
          Text(taskRest.title),
          Text('${taskRest.id}'),
          Text('${taskRest.userId}'),
          Text('${taskRest.completed}')
        ]
      ),
    );
  }
}
