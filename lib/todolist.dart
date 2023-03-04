import 'package:flutter/material.dart';
import 'package:flutter_myself/modal/items.dart';

import 'widget/card_body_widget.dart';
import 'widget/card_modal_bottom.dart';
class todolist extends StatelessWidget {
todolist({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDoList',
      home: ToDoList(),
    );
  }
}
//Chuyển từ stateless sang sateful vì chuyển sang sateful mới xài đc setsate
class ToDoList extends StatefulWidget {
  ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<DataItems> items = []; 

  void _handleAddTask (String name) {
    //print(name);
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    print(items);
    setState(() {
      items.add(newItem);
    });
  }
  void _handleDeleteTask (String id) {
    //print(id);
    setState(() {
          items.removeWhere((item) => item.id == id );
    });
  }
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true ,
          title: Text(
          "ToDoList",
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
        ),
        ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20 ), // đối xứng

          child: Column(
            children: items.map((item) => CardBody(
              index: items.indexOf(item), // xác định ví trị index
              item : item, 
              handleDelete: _handleDeleteTask,)).toList(), //Duyệt phần tử bên trong item sau đó lấy ra các ptu bên trong item
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              isScrollControlled: true,
              context: context, 
              builder: (BuildContext context ){
                return ModalBottom(addTask: _handleAddTask);
              },
            );
          },
            child: const Icon(
              Icons.add,
              size: 40,),
          ),
         );
  }
}



