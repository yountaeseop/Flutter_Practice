import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> todoList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    todoList.add('할 일 #1');
    todoList.add('할 일 #2');
    todoList.add('할 일 #3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ListViewScreen'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
          itemBuilder: (context, index){
            return Text(
              todoList[index],
              style: const TextStyle(fontSize: 20),
            );
          },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addTodo(context);
        },
        child: const Icon(Icons.add),
      ));
  }
  void _addTodo(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/addList');
    setState(() {
      todoList.add(result as String);
    });
  }
}
