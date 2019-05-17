
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
 Widget build(context){
   return MaterialApp(
     title: 'Flutter',
     theme: ThemeData(primaryColor: Colors.white),
     home:RandomWords(),
   );
 }
}
class RandomWordState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = <WordPair>[]; //保存用户收藏的单词
  Widget _buildSession(){
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context,i){
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
  Widget _buildRow(WordPair wordPair){
    final bool alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red:null,
        ),
      onTap: (){
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
  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context){
          final Iterable<ListTile> _titles = _saved.map((WordPair wordPair){
            return ListTile(
              title: Text(wordPair.asPascalCase,
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
            body: ListView(children: divide,),
          );
        },
      ),
    );
  }
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Let us begin'
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
            ),
          ],
      ),
      body: _buildSession(),
    );
  }
}
class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}



