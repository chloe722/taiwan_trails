import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';
import 'package:flutter_app/trail_data_container.dart';

void main() {
  runApp(Trails());
}

class Trails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'trail',
      home: TrailsList(),
    );
  }
}

class TrailsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Taiwan Trails',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.0),
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: TrailDataContainer(trailBuilder: (trails) {
          return ListView.builder(itemBuilder: (context, index) {
            print(trails);
            if (index + 1 > trails.length) {
              return null;
            }
            final trail = trails.elementAt(index);
            if (trail == null) {
              return null;
            } else {
              return TrailRow(trail: trail);
            }
          });
        }));
  }
}
//
//class TrailCard extends StatelessWidget {
//  final Trail trail;
//
//  const TrailCard({Key key, this.trail}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      margin: EdgeInsets.all(10.0),
//      elevation: 10.0,
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//      child: Container(
//          padding: EdgeInsets.all(30.0),
//          child: Row(
//            children: <Widget>[
//              Container(
//                width: 80.0,
//                height: 80.0,
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: DecorationImage(
//                        fit: BoxFit.fill,
//                        image:
//                            NetworkImage(trail.TR_IMAGE))),
//              ),
//              Expanded(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Align(
//                      alignment: Alignment.topRight,
//                      child: Container(
//                        child: Text(
//                          trail.TR_CNAME,
//                          style: TextStyle(
//                            fontSize: 20.0,
//                            color: Colors.red,
//                          ),
//                        ),
//                      ),
//                    ),
//                    Text(
//                      trail.TR_POSITION,
//                      style: TextStyle(fontSize: 16.0),
//                    )
//                  ],
//                ),
//              ),
//            ],
//          )),
//    );
//  }
//}

class TrailRow extends StatelessWidget {
  final Trail trail;

  const TrailRow({Key key, this.trail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trailThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: Hero(
        tag: 'trail_hero-${trail.TRAILID}',
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(trail.TR_IMAGE))),
        ),
      ),
    );

    final trailCard = Container(
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
          color: Colors.white70,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black12, offset: Offset(0.0, 10.0))
          ]),
    );

    final trailCardContent = Container(
      margin: EdgeInsets.fromLTRB(100.0, 16.0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(trail.TR_CNAME,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
          Container(height: 10.0),
          Text(trail.TR_POSITION,
              style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w200)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 15.0,
            width: 18.0,
          ),
          Row(
            children: <Widget>[
              Text(trail.TR_LENGTH),
              Padding(padding: EdgeInsets.only(right: 30.0)),
              Text(trail.TR_CLASS),
            ],
          ),
        ],
      ),
    );

    return GestureDetector(
//      onTap: () => Navigator.pushNamed(context, "/detail"),
      onTap: () => Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => DetailPage(trail),
              transitionDuration: const Duration(milliseconds: 1000),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
//                      ScaleTransition(scale: animation, child: child),
//                      RotationTransition(turns: animation, child: child),
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Stack(
          children: <Widget>[
            trailCard,
            trailThumbnail,
            trailCardContent,
          ],
        ),
      ),
    );
  }
}

// Detail Page
class DetailPage extends StatelessWidget {
  final Trail trail;

  DetailPage(this.trail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white70,
      child: Stack(
        children: <Widget>[
          _getBackground(),
          _getGradient(),
          _getContent(),
//          _getToolbar(context),
        ],
      ),
    )
//      Center(
//        child: Column(
//          children: <Widget>[
//            Text(trail.TR_CNAME),
//            Hero(
//              tag: 'trail-hero-${trail.TRAILID}',
//              child: Container(
//                width: 80.0,
//                height: 80.0,
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: DecorationImage(
//                        fit: BoxFit.fill,
//                        image:
//                            NetworkImage("https://i.imgur.com/aYJSnq9.jpg"))),
//              ),
//            )
//          ],
//        ),
        );
  }

  Container _getBackground() {
    return Container(
      child: Image.network(
        trail.TR_BANNER,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 290.0),
    );
  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[new Color(0x0000ACC1), new Color(0xFF00ACC1)],
              stops: [0.0, 0.9],
              begin: const FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 1.0))),
    );
  }

  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        TrailSummary(trail, horizontal: false),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_overviewTitle, style: TextStyle(fontSize: 20.0)),
              Separator(),
              Text(trail.TR_INTRO)
            ],
          ),
        )
      ],
    );
  }
}

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff));
  }
}

class TrailSummary extends StatelessWidget {
  final Trail trail;
  final bool horizontal;

  TrailSummary(this.trail, {this.horizontal = true});

  TrailSummary.vertical(this.trail) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final trailThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: 'trail_hero-${trail.TRAILID}',
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(trail.TR_IMAGE))),
        ),
      ),
    );

    Widget _trailValue({String value, String image}) {
      return Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(image),
            Container(width: 8.0),
            Text(trail.TR_CNAME)
          ],
        ),
      );
    }

    final trailCard = Container(
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
          color: Colors.white70,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black12, offset: Offset(0.0, 10.0))
          ]),
    );

    final trailCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 100.0, 16.0, 16.0),
      child: Center(
        child: Column(
          crossAxisAlignment:
              horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 4.0),
            Center(
              child: Text(trail.TR_CNAME,
                  style:
                      TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
            ),
            Container(height: 10.0),
            Text(trail.TR_POSITION,
                style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w200)),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                height: 15.0,
                width: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                Text(trail.TR_LENGTH),
                Padding(padding: EdgeInsets.only(right: 30.0)),
                Text(trail.TR_CLASS),
              ],
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailPage(trail),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Stack(
          children: <Widget>[
            trailCard,
            trailThumbnail,
            trailCardContent,
          ],
        ),
      ),
    );
  }
}
