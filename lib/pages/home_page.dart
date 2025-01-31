import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('myBox');

  final _textController = TextEditingController();

  List TodoList = [];

  @override
  void initState() {
    super.initState();
    TodoList = _mybox.get('todo', defaultValue: []);
  }

  void _addTodo() {
    setState(() {
      TodoList.add(_textController.text);
      _mybox.put('todo', TodoList);
      _textController.clear();
    });
  }

  void _deleteTodo() {
    setState(() {
      TodoList.clear();
      _mybox.put('todo', TodoList);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
