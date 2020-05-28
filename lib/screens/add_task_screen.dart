import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todoeyflutter/utilities/constants.dart';

class AddTaskScreen extends StatelessWidget {

  final Function addToList;

  AddTaskScreen({this.addToList});

  @override
  Widget build(BuildContext context) {

    var name;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Task', style: kCardTitleStyle,),
          Card(
            elevation: 2,
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Take a walk at the park'
              ),
              onChanged: (value) {
                name = (value != null) ? value : null;
              } ,
              onSubmitted: (value) {
                if (value != null) { addToList(value); }
              } ,
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (name != null){ addToList(name); }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Feather.check),
                SizedBox(width: 5),
                Text('Add to list'),
              ],
            ),
            textColor: Colors.white,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
