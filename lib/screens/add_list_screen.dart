import 'package:flutter/material.dart';
import 'package:todoeyflutter/utilities/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AddListScreen extends StatelessWidget {

  final Function createList;

  AddListScreen({this.createList});

  @override
  Widget build(BuildContext context) {

    String name;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('List', style: kCardTitleStyle,),
          Card(
            elevation: 2,
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Projects'
              ),
              onChanged: (value) {
                name = (value != null) ? value : null;
              } ,
              onSubmitted: (value) {
                if (value != null) { createList(value); }
              } ,
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (name != null){ createList(name); }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Feather.check),
                SizedBox(width: 5),
                Text('Create list'),
              ],
            ),
            textColor: Colors.white,
            color: Colors.black,
          )
        ],
      ),
      ),
    );
  }
}
