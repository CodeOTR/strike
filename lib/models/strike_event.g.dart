// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strike_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrikeEvent _$StrikeEventFromJson(Map<String, dynamic> json) => StrikeEvent(
      id: json['id'] as String?,
      eventType: json['eventType'] as String?,
      webhookVersion: json['webhookVersion'] as String?,
      created: getDateFromTimestamp(json['created']),
      deliverySuccess: json['deliverySuccess'] as bool?,
      data: json['data'],
    );

Map<String, dynamic> _$StrikeEventToJson(StrikeEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventType': instance.eventType,
      'webhookVersion': instance.webhookVersion,
      'created': getStringFromDateTime(instance.created),
      'deliverySuccess': instance.deliverySuccess,
      'data': instance.data,
    };
