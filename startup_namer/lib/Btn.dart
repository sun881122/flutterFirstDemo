import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class BtnWidget extends StatelessWidget{
  // int count = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Btn Padding'),
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: (){
            //  count++;
             print('点我啊');

          },
          child: Text('title'),
          padding: EdgeInsets.only(left: 10,right: 10),
        ),
      ),
    );
  }
}