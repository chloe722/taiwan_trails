import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Trail {
  final String TRAILID;
  final String TR_CNAME;
  final String TR_CLASS;
  final String TR_MAIN_SYS;
  final String TR_SUB_SYS;
  final String TR_ADMIN;
  final String TR_ADMIN_PHONE;
  final String TR_POSITION;
  final String TR_ENTRANCE;
  final String TR_LENGTH;
  final String TR_ALT;
  final String TR_PAVE;
  final String TR_DIF_CLASS;
  final String TR_TOUR;
  final String TR_BEST_SEASON;
  final String TR_SPECIAL;

  Trail(
      {this.TRAILID,
      this.TR_CNAME,
      this.TR_CLASS,
      this.TR_MAIN_SYS,
      this.TR_SUB_SYS,
      this.TR_ADMIN,
      this.TR_ADMIN_PHONE,
      this.TR_POSITION,
      this.TR_ENTRANCE,
      this.TR_LENGTH,
      this.TR_ALT,
      this.TR_PAVE,
      this.TR_DIF_CLASS,
      this.TR_TOUR,
      this.TR_BEST_SEASON,
      this.TR_SPECIAL});
}

List<Trail> getTrailsSample() {
  return <Trail>[
    Trail(
        TRAILID: "001",
        TR_CNAME: "蘇花古道：大南澳越嶺段",
        TR_CLASS: "國家級步道",
        TR_MAIN_SYS: "蘇花-比亞毫國家步道系統",
        TR_SUB_SYS: "",
        TR_ADMIN: "羅東林區管理處",
        TR_ADMIN_PHONE: "(03)954-5114轉育樂課",
        TR_POSITION: "宜蘭縣南澳鄉",
        TR_ENTRANCE: "宜蘭縣南澳鄉",
        TR_LENGTH: "4.1公里",
        TR_ALT: "650",
        TR_PAVE: "土徑步道、土木階梯",
        TR_DIF_CLASS: "2",
        TR_TOUR: "1日",
        TR_BEST_SEASON: "四季皆宜",
        TR_SPECIAL: ""),
    Trail(
        TRAILID: "002",
        TR_CNAME: "南澳古道",
        TR_CLASS: "國家級步道",
        TR_MAIN_SYS: "蘇花-比亞毫國家步道系統",
        TR_SUB_SYS: "",
        TR_ADMIN: "羅東林區管理處",
        TR_ADMIN_PHONE: "(03)954-5114轉育樂課",
        TR_POSITION: "宜蘭縣南澳鄉",
        TR_ENTRANCE: "宜蘭縣南澳鄉",
        TR_LENGTH: "3.8公里",
        TR_ALT: "400",
        TR_PAVE: "木棧道、碎石山徑",
        TR_DIF_CLASS: "1",
        TR_TOUR: "半日",
        TR_BEST_SEASON: "春",
        TR_SPECIAL: "")
  ];
}

Future<List<Trail>> getTrailsSampleFuture() async {
  await Future.delayed(Duration(seconds: 1));
  return getTrailsSample();
}

Future<List<Trail>> getTrailFromJson() async {
  String dataPath = 'data/taiwan_trail.json';
  String data = await rootBundle.loadString(dataPath);
  List<dynamic> json = jsonDecode(data);
  return json.map((row) {
    return Trail(
      TRAILID: row['TRAILID'],
      TR_CNAME: row['TR_CNAME'],
      TR_CLASS: row['TR_CLASS'],
      TR_MAIN_SYS: row['TR_MAIN_SYS'],
      TR_SUB_SYS: row['TR_SUB_SYS'],
      TR_ADMIN: row['TR_ADMIN'],
      TR_ADMIN_PHONE: row['TR_ADMIN_PHONE'],
      TR_POSITION: row['TR_POSITION'],
      TR_ENTRANCE: row['TR_ENTRANCE'],
      TR_LENGTH: row['TR_LENGTH'],
      TR_ALT: row['TR_ALT'],
      TR_PAVE: row['TR_PAVE'],
      TR_DIF_CLASS: row['TR_DIF_CLASS'],
      TR_TOUR: row['TR_TOUR'],
      TR_BEST_SEASON: row['TR_BEST_SEASON'],
      TR_SPECIAL: row['TR_SPECIAL'],
    );
  }).toList();
}
