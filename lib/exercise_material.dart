import 'package:flutter/material.dart';

void main() {
  runApp(Exercise());
}

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Material design app'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[Icon(Icons.star), Text('star')],
                    ),
                    Column(
                      children: <Widget>[Icon(Icons.share), Text('share')],
                    ),
                    Column(
                      children: <Widget>[Icon(Icons.print), Text('print')],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Image(
                  image: AssetImage('images/lake.jpg'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add),
                    Text(
                      'add',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add),
                    Text(
                      'add',
                      style: TextStyle(fontSize: 25.0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add),
                    Text(
                      'add',
                      style: TextStyle(fontSize: 28.0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add),
                    Text(
                      'add',
                      style: TextStyle(fontSize: 30.0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add),
                    Text(
                      'add',
                      style: TextStyle(fontSize: 45.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              print('item: $index');
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), title: Text('alerm')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), title: Text('alerm')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), title: Text('alerm')),
            ]),
      ),
    );
  }
}

