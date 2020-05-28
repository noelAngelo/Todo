import 'package:flutter/foundation.dart';
import 'task.dart';

class ListData extends ChangeNotifier {
  Map<String, List<Task>> lists = {
    'Fruits': [Task(name: 'Apples'), Task(name: 'Mangoes')],
    'Groceries': []
  };

}