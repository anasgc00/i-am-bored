//{ Api response
//  "activity": "Surprise your significant other with something considerate",
//  "type": "social",
//  "participants": 1,
//  "price": 0,
//  "link": "",
//  "key": "6204657",
//  "accessibility": 0
//}

import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String activity;
  final String type;
  final int participants;
  final int price;
  final String key;
  final String? link;
  final int accessibility;

  const Activity(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.key,
      this.link,
      required this.accessibility});

  @override
  List<Object?> get props =>
      [activity, accessibility, type, participants, price, key];
}
