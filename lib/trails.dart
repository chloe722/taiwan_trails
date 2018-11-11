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
        appBar: AppBar(
          title: Text('trail'),
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
              //            return ListTile(
              //              title: Text(trail.TR_CNAME),
              //            );
              return TrailCard(trail: trail);
            }
          });
        }));

////          }
//          }
//        }));
  }
}

class TrailCard extends StatelessWidget {
  final Trail trail;

  const TrailCard({Key key, this.trail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            trail.TR_CNAME,
          ),
          Text(
            trail.TR_POSITION,
          )
        ],
      ),
    );
  }
}
