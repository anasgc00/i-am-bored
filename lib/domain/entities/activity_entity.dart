//{ Api response
//  "activity": "Surprise your significant other with something considerate",
//  "type": "social",
//  "participants": 1,
//  "price": 0,
//  "link": "",
//  "key": "6204657",
//  "accessibility": 0
//}

class Activity {
  final String activityName;
  final String type;
  final int participants;
  final int price;
  final String key;
  final String? link;
  final int accesibility;

  Activity(
      {required this.activityName,
      required this.type,
      required this.participants,
      required this.price,
      required this.key,
      this.link,
      required this.accesibility});
}
