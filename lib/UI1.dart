import 'package:flutter/material.dart';
class UI1 extends StatelessWidget {
  const UI1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tat thanh debug
      home: Scaffold (
      body: Stack(
        children: [ 
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boxMethod('box1', Alignment.bottomRight),
                boxMethod('box2', Alignment.bottomLeft),
                
                // Container(               
                //   alignment: Alignment.bottomLeft, // can chinh chu trong box
                //   width: 160,
                //   height: 160,
                //   color: Colors.green,
                //   child: Text(
                //    'box 2',
                //    style: TextStyle(
                //     fontSize: 24,
                //     color: Colors.pinkAccent), 
                //   ),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boxMethod('box3', Alignment.topRight),
                boxMethod('box4', Alignment.topLeft),
                // Container(
                //   alignment: Alignment.bottomRight, // can chinh chu trong box
                //   width: 160,
                //   height: 160,
                //   color: Colors.green,
                //   child: Text(
                //    'box 3',
                //    style: TextStyle(
                //     fontSize: 24,
                //     color: Colors.pinkAccent), 
                //   ),
                // ),
                // Container(
                  
                //   alignment: Alignment.bottomLeft, // can chinh chu trong box
                //   width: 160,
                //   height: 160,
                //   color: Colors.green,
                //   child: Text(
                //    'box 4',
                //    style: TextStyle(
                //     fontSize: 24,
                //     color: Colors.pinkAccent), 
                //   ),
                // ),
              ],
            ),
          ],
        ),
        Center(
          child: boxMethod('Hello Ai', Alignment.center, true))
        ]
      ),
      
    )
    );
  }
  // Vi chuong trinh co 4 box giong nhau nen ta extract new method de goi lai 
  Container boxMethod(String name, Alignment direction, [bool boxRadius = false]) { // [bool boxRadius = false] -> bat buoc
    return Container(
              decoration: BoxDecoration(
                color: boxRadius ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular( boxRadius ? 100 : 0)
              ) ,
              alignment: direction, // can chinh chu trong box
              width: 160,
              height: 160,
              child: Text(
               name,
               style: TextStyle(
                fontSize: 24,
                color: Colors.pinkAccent), 
              ),
            );
  }
}