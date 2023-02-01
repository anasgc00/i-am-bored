// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: json['price'] as int,
      key: json['key'] as String,
      accessibility: json['accessibility'] as int,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
      'key': instance.key,
      'accessibility': instance.accessibility,
    };
