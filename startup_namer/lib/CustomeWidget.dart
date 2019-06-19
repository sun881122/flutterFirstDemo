import 'package:flutter/material.dart';
class A extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('custom btn'),),
      body: Center(child: CustomeButton('haha', Colors.red),) ,
    ); 
  }
}
class CustomeButton extends StatelessWidget{
  CustomeButton(this.title,this.color);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){
      print('tap me');
    },
    textColor: color,
    child: Text(title),);
  }
}