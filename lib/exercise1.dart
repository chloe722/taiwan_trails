import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(CustomListTile());
}

class CustomListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taiwan ListTile',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Taiwan Trails'),
        ),
        body: TrailList(),
      ),
    );
  }
}

class TrailList extends StatefulWidget{
  @override
  TrailListState createState() => TrailListState();

}

class TrailListState extends State<TrailList> {
  List<WordPair> _words = <WordPair>[];

  @override
  Widget build(BuildContext context) {
  }

  Widget _buildTrails() {
    return new ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }

        return _buildRows(_words[index]);
      },
    );
  }

  Widget _buildRows(WordPair word) {
    return Material(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

        ),
      ),
    );
  }
}
