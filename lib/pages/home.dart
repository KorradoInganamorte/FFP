import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String fieldToDo = "";
  List todo = [];

  @override
  void initState() {
    super.initState();
    todo.addAll(["Work", "Car", "home"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        title: const Text(
          "Todo",
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (BuildContext context, int i) {
            return Dismissible(
              key: Key(todo[i]),
              child: Card(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                elevation: 0.6,
                child: ListTile(
                  title: Text(todo[i]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete,
                        color: Colors.black.withOpacity(0.1)),
                    onPressed: () => {
                      setState(() {
                        todo.removeAt(i);
                      })
                    },
                  ),
                ),
              ),
              onDismissed: (direction) => {
                setState(() {
                  todo.removeAt(i);
                })
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black.withOpacity(0.1),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Add ToDo"),
                  content: TextField(
                    onChanged: (String value) {
                      fieldToDo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todo.add(fieldToDo);
                        });

                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.add, color: Colors.green[200]),
                    )
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
