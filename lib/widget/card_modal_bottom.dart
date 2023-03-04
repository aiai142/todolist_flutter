import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
   ModalBottom({
    super.key,
    required this.addTask
  });
  final Function addTask;
  //String textValue =''; cách 1
  TextEditingController controller = TextEditingController();
  void _handleOnclick(BuildContext context) {
    //print(textValue); //cach 1
    final name = controller.text;
    if(name.isEmpty) { // Nếu ng dùng ko nhập gì cả thì chỉ return
      return; 
    }
    addTask(name);
    //print(controller.text);
    Navigator.pop(context); // trở về list to do sau khi add task thành công
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText:'Your task',
              ),
              // onChanged:(text) { //cách 1: dùng onchange
              //   textValue = text;
              // } ,
              controller: controller,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:() => _handleOnclick(context), 
                child: Text('Add task'),
                ),
            )
        ]),
      ),
    );
  }
}