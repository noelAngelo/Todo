import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final String taskName;
  final bool isChecked;
  final Function toggle;

  TaskTile({this.taskName, this.isChecked, this.toggle});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: toggle,
      title: Text(taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
    );
  }


}