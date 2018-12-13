import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';

void main() {
  runApp(CardSwip());
}

class CardSwip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardList(),
    );
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
//          MountainCard(
//              "http://4.bp.blogspot.com/-FOC-WS9s0QA/UQGY1pTn1OI/AAAAAAAACPE/8G5tI39PzO4/s640/2009_03_Shattered_490X327.jpg"),
//          MountainCard(
//              "http://4.bp.blogspot.com/-FOC-WS9s0QA/UQGY1pTn1OI/AAAAAAAACPE/8G5tI39PzO4/s640/2009_03_Shattered_490X327.jpg"),
//          MountainCard(
//              "http://4.bp.blogspot.com/-FOC-WS9s0QA/UQGY1pTn1OI/AAAAAAAACPE/8G5tI39PzO4/s640/2009_03_Shattered_490X327.jpg"),

          Positioned(
            top: 10.0,
            child: MountainCard(
                "http://4.bp.blogspot.com/-FOC-WS9s0QA/UQGY1pTn1OI/AAAAAAAACPE/8G5tI39PzO4/s640/2009_03_Shattered_490X327.jpg"),
          ),

          Positioned(
            top: 20.0,
            child: MountainCard(
                "http://4.bp.blogspot.com/-FOC-WS9s0QA/UQGY1pTn1OI/AAAAAAAACPE/8G5tI39PzO4/s640/2009_03_Shattered_490X327.jpg"),
          ),

          Positioned(
            top: 30.0,
            child: MountainCard(
                "http://4.bp.blogspot.com/-FOC-WS9s0QA/UQGY1pTn1OI/AAAAAAAACPE/8G5tI39PzO4/s640/2009_03_Shattered_490X327.jpg"),
          ),
        ],
      ),
    );
  }
}

class MountainCard extends StatelessWidget {
  var image = "";

  MountainCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: NetworkImage(image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RawMaterialButton(
                            shape: CircleBorder(side: BorderSide.none),
                            elevation: 5.0,
                            fillColor: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.greenAccent,
                            )),
                        RawMaterialButton(
                            shape: CircleBorder(side: BorderSide.none),
                            elevation: 5.0,
                            fillColor: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            )),
//
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
