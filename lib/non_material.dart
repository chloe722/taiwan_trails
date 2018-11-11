import 'package:flutter/material.dart';

void main() {
  runApp(MyCard());
}

enum Actions {
  call,
  route,
  share
}

class MyCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // TitleSection
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    // ButtonSection
    Widget buildButtonColumn(IconData icon, String label, Actions action) {
      Color color = Theme.of(context).primaryColor;

      return GestureDetector(
        onTap: onTap(action),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      ));
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL', Actions.call),
          buildButtonColumn(Icons.near_me, 'ROUTE', Actions.route),
          buildButtonColumn(Icons.share, 'share', Actions.share),
        ],
      ),
    );

    // TextSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Top Lakes'),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/lake.jpg',
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )

      ),
    );
  }

    VoidCallback onTap(Actions action) {
    return () {
      switch(action) {
        case Actions.call:
          print('call icon pressed');
          break;
        case Actions.route:
          print('rout icon pressed');
          break;

        case Actions.share:
          print('share');
          break;

        default:
          return;
      }
    };
  }
}


class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(){
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
          icon: _isFavorited? Icon(Icons.star): Icon(Icons.star_border),
          color: Colors.red[500],
          onPressed: _toggleFavorite),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );}
}






