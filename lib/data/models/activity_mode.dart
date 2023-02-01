import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_mode.g.dart';

//{ Api response
//  "activity": "Surprise your significant other with something considerate",
//  "type": "social",
//  "participants": 1,
//  "price": 0,
//  "link": "",
//  "key": "6204657",
//  "accessibility": 0
//}

@JsonSerializable()
class ActivityModel extends Activity {
  ActivityModel(
      {required super.activity,
      required super.type,
      required super.participants,
      required super.price,
      required super.key,
      required super.accessibility});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);

  //factory ActivityModel.fromJson(Map<String, dynamic> json) {
  //  return ActivityModel(
  //      activityName: json["activity"],
  //      type: json["type"],
  //      participants: (json["participants"] as num).toInt(),
  //      price: (json["price"] as num).toInt(),
  //      key: json["key"],
  //      accesibility: (json["accessibility"] as num).toInt());
  //}
//
  //Map<String, dynamic> toJson() {
  //  return {
  //    'activityName': activityName,
  //    'type': type,
  //    'participants': participants,
  //    'key': key,
  //    'price': price,
  //    'accesibility': accesibility
  //  };
  //}
}
