import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TestA extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SampleAppPage();
  }
}
class SampleAppPage extends StatefulWidget{
  SampleAppPage({Key key}):super(key:key);
  @override
  SampleAppSate createState() => SampleAppSate();
}
class SampleAppSate extends State<SampleAppPage>{
  String showText = 'this is text test';
  bool toggle = true;
  void _updateText(){
    setState(() {
      showText = 'change after dksjf sdflksjd fksj sdfjsdlfjdslkfjjsdfsfjsdslfjslkfk dsjfsdkjfskdlfjsk';
    });
  }
  void _toggle(){
    setState(() {
      toggle = !toggle;
    });
  }
  Widget _getToggleChild(){
    if (toggle) {
      return Text('Toggle One');
    } else {
      return MaterialButton(onPressed: (){},child: Text('Toggle two'),);
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text',
          style: TextStyle(fontSize: 25,color: Colors.orange),
        ),
        actions: <Widget>[IconButton(
          icon: Icon(Icons.featured_play_list),
          onPressed: _updateText ,)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
      body: Center(
        //  child: Text(showText,
        //  style: TextStyle(color: Colors.red,fontSize: 28),
        // ),
        child: _getToggleChild(),
      ),
    );
  }
}