import 'package:flutter/material.dart';
import '../models/task.dart';

class screen1 extends StatelessWidget{
  
  Widget build(BuildContext context){
    List<Task> tasks = Task.generateTask(5);
    return Scaffold(
      appBar: AppBar(
        title: Text("test1"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Text(tasks[index].title);
        },
      ),
    );
  }
}