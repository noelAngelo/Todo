import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:todoeyflutter/screens/list_screen.dart';
import '../utilities/constants.dart';
import 'package:todoeyflutter/utilities/screen_arguments.dart';
import 'package:todoeyflutter/models/task.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    @required this.title,
    @required this.items,
  });

  final String title;
  final List<Task> items;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(title, style: kCardTitleStyle,),
      subtitle: Text('${items.length} items'),
      dense: true,
      onTap: () => Navigator.pushNamed(
          context,
          ListScreen.route,
          arguments: ListArguments(title)
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  const CardTile({
    Key key,
    @required this.items,
    @required this.title,
  }) : super(key: key);

  final List<Task> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('${Provider.of<ListData>(context).lists[title].length} items'.toUpperCase()),
                  Text(title,
                      overflow: TextOverflow.ellipsis,
                      style: kCardTitleStyle
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}