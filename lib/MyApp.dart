import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'transaction.dart';
class MyApp extends StatefulWidget {
  // String name;
  // int age;
  //MyApp({required this.name, required this.age});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); 
    }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

    final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
   final _amountController = TextEditingController(); // Mỗi thẻ textfield có 1 đối tượng TextEditing riêng
   final _contentController = TextEditingController(); // Mỗi thẻ textfield có 1 đối tượng TextEditing riêng
   //define a state
   Transaction transaction = Transaction(content: '', amount: 0.0);
   List<Transaction> _transaction = <Transaction>[];
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //print('Run initState');
  }
  @override 
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    //print('Run dispose');
  }
  @override
  Widget build(BuildContext context) {
    // Hiển thị date hiện tại
    DateTime now = new DateTime.now();
    DateTime someDate = new DateTime(2023, 2,3);
    return MaterialApp(
      title: "This is statefulwidget",
      scaffoldMessengerKey: _scaffoldKey,
      home: Scaffold(
        body: SafeArea(
          // padding tối thiểu
          minimum: const EdgeInsets.only(left: 20, right: 20 ),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // cột từ trên xuống
                 children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Content' ),
                    controller: _contentController,
                    onChanged: (text){
                      setState(() {
                        //_transaction.content =text;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount(money)' ),
                    controller: _amountController,
                    onChanged: (text){
                      setState(() {
                       // _transaction.amount = double.tryParse(text) ?? 0;
                      });
                    },
                  ),
                  TextButton(
                    child: Text('Insert'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      print('You pressed this button');
                      // Display into UI ?
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Content = $_content, Money = $_amount'),)
                      //     );
                    //   ScaffoldMessengerState.showSnackBar(SnackBar(content: Text('Content = $content, Money = $amount'),
                    //   duration: const Duration(seconds: 10),));
                    final snackBar = SnackBar(content: 
                        const Text('Press in button'),
                        action: SnackBarAction(label: 'Undo',
                                              onPressed: (){},),);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                 ],
                    ),
        ),
      ),
    ); 
  }
}