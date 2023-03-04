
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({
    super.key,
    required this.item,
    required this.handleDelete,
    required this.index
  });
  var item;
  var index;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity ,
      height: 70,
      decoration: BoxDecoration(
        color: (index % 2==0) ? const Color(0xfffDFDFDF): Color.fromARGB(255, 223, 58, 108),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding( 
        padding: EdgeInsets.symmetric(horizontal:20 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name,
              style: TextStyle(
                fontSize: 20,
                color:  const Color(0xfff4B4B4B),
                fontWeight: FontWeight.bold,
              ),
              ),
            InkWell(
            onTap:() 
              //print('delete');
              //handleDelete(item.id);
             async {
            if (await confirm(context)) {
              //return print('pressedOK');
              handleDelete(item.id);
            }
            return;
          },
            child: Icon(
              Icons.delete_outline,
              color: const Color(0xfff4B4B4B),
              size: 20,),
              ),
        ],
        
      ),
      ),
    );
  }
}