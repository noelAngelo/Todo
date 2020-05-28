import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:todoeyflutter/screens/list_screen.dart';
import 'package:todoeyflutter/screens/project_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListData(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.white10,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black
            )
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(
              color: Colors.white
            )
          ),
          toggleableActiveColor: Colors.white,
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.white
          ),
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),

        initialRoute: ProjectScreen.route,
        routes: {
          ProjectScreen.route: (context) => ProjectScreen(),
          ListScreen.route: (context) => ListScreen(),
        },
      ),
    );
  }
}