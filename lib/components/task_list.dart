import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoeyflutter/models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({@required this.tasks,});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (context, index){
        return TaskTile(
          taskName: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          toggle: (checkedBoxState) {
            setState(() {
              widget.tasks[index].toggle();
            });
          }
        );
      })
    );
  }
}