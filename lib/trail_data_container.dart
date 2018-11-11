import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';

//typedef Widget TrailBuilder(List<Trail> trails);
typedef TrailBuilder = Widget Function(List<Trail> trails);

class TrailDataContainer extends StatelessWidget {
  final TrailBuilder trailBuilder;

  TrailDataContainer({this.trailBuilder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trail>>(
      future: getTrailFromJson(),
      // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<Trail>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Awaiting result...');
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return trailBuilder(snapshot.data);
        }
      },
    );
  }
}
