// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      handle: json['handle'] as String?,
      canReceive: json['canReceive'] as bool?,
      currencies: (json['currencies'] as List<dynamic>?)
          ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'handle': instance.handle,
      'canReceive': instance.canReceive,
      'currencies': instance.currencies?.map((e) => e.toJson()).toList(),
    };
