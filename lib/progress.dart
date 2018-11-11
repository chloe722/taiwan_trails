import 'package:flutter/material.dart';

void main(){
  runApp(MyWidget());

}

class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My widget lists',
      home: new WidgetLists(),
    );
  }
}

class WidgetLists extends StatefulWidget {
  @override
  WidgetListsState createState() => new WidgetListsState();
}

class WidgetListsState extends State<WidgetLists>{
  final List<Widget> _widgets = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widgets'),
      ),
      body: _buildWidgetList(),
    );
  }

  Widget _buildWidgetList() {
    return new ListView.builder(
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

      },
    );
  }
}
