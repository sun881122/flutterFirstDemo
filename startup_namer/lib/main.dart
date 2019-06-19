import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart' as prefix1;
import 'package:startup_namer/CanansTest.dart' as prefix0;
import 'Text.dart';
import 'Btn.dart';
import 'Animation.dart';
import 'Canvans.dart';
import 'CanansTest.dart';
import 'CustomeWidget.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(CupertinoApp(home: MyApp(),
  routes:<String,WidgetBuilder>{
    'a':(BuildContext context) => A(),
    'b':(BuildContext context) => A(),
    'c':(BuildContext context) => A(),
  } ,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(primaryColor: Colors.white),
      home: RandomWords(),
    );
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = <WordPair>[]; //保存用户收藏的单词
  Widget _buildSession() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        final _index = i ~/ 2;
        if (_index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[_index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final bool alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final Iterable<ListTile> _titles = _saved.map((WordPair wordPair) {
            return ListTile(
              title: Text(
                wordPair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });
          final List<Widget> divide = ListTile.divideTiles(
            context: context,
            tiles: _titles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved'),
            ),
            body: ListView(
              children: divide,
            ),
          );
        },
      ),
    );
  }

  void _pushNewWidget() {
    // Navigator.of(context).pushNamed('b');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      // return TestA(); //文本
      // return BtnWidget();//按钮
      // return FadeAppTest(title: 'My Test',);
      // return Signature();
      // return Signaturee();
      return A();
    }));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Let us begin'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.filter_tilt_shift),
        iconSize: 40,
        onPressed: _pushNewWidget,
      ),
      body: _buildSession(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}
