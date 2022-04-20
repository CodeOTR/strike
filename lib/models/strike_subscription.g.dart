// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strike_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrikeSubscription _$StrikeSubscriptionFromJson(Map<String, dynamic> json) =>
    StrikeSubscription(
      id: json['id'] as String?,
      webhookUrl: json['webhookUrl'] as String?,
      webhookVersion: json['webhookVersion'] as String?,
      enabled: json['enabled'] as bool?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      eventTypes: (json['eventTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$StrikeSubscriptionToJson(StrikeSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'webhookUrl': instance.webhookUrl,
      'webhookVersion': instance.webhookVersion,
      'enabled': instance.enabled,
      'created': instance.created?.toIso8601String(),
      'eventTypes': instance.eventTypes,
    };
