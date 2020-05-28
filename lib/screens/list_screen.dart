import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/components/task_list.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:todoeyflutter/screens/add_task_screen.dart';
import 'package:todoeyflutter/utilities/constants.dart';
import 'package:todoeyflutter/utilities/screen_arguments.dart';
import 'package:todoeyflutter/models/task.dart';

class ListScreen extends StatefulWidget {
  static const String route = '/lists';

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {

    final ListArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesome5Solid.pen),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              isDismissible: true,
              builder: (context) => AddTaskScreen(
                  addToList: (taskName) {
                    if (taskName != '') {
                  setState(() {
                    Provider.of<ListData>(context, listen: false)
                        .lists[args.title]
                        .add(Task(name: taskName));
                  });
                  Navigator.pop(context);
                    }})
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(args.title, style: kListTitleStyle,),
              TaskList(tasks: Provider.of<ListData>(context).lists[args.title],)
            ],
          )),
        ),
    );
  }
}




