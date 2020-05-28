import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/components/date_section.dart';
import 'package:todoeyflutter/components/list_item.dart';
import 'package:todoeyflutter/models/task.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:todoeyflutter/screens/add_list_screen.dart';

class ProjectScreen extends StatefulWidget {
  static const String route = '/';

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  String formattedDate;
  final String data = 'My data';

  void getDate() {
    var now = DateTime.now();
    formattedDate = DateFormat('EEEE, MMM dd').format(now);
  }

  @override
  Widget build(BuildContext context) {

    getDate();

    Map<String, List<Task>> lists = Provider.of<ListData>(context).lists;
    List<String> listNames = [];
    lists.forEach((key, value) {
      listNames.add(key);
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          AntDesign.plus,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context) => AddListScreen(
                  createList: (name) {
                    if (name != '') {
                    setState(() {
                      Provider.of<ListData>(context, listen: false).lists[name] = [];
                    });
                    Navigator.pop(context);
                  }}
              ));
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateSection(formattedDate: formattedDate),
              Expanded(
                child: ListView.builder(
                    itemCount: listNames.length,
                    itemBuilder: (context, index) {
                      String key = listNames[index];
                      return ListItem(
                          title: listNames[index],
                          items: Provider.of<ListData>(context).lists[key],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
