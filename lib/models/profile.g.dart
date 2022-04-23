// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      handle: json['handle'] as String?,
      canReceive: json['canReceive'] as bool?,
      currencies: (json['currencies'] as List<dynamic>?)
          ?.map((e) => ProfileCurrency.fromJson(e as Map<String, dynamic>))
          .toList(),
      avatarUrl: json['avatarUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'handle': instance.handle,
      'avatarUrl': instance.avatarUrl,
      'description': instance.description,
      'canReceive': instance.canReceive,
      'currencies': instance.currencies?.map((e) => e.toJson()).toList(),
    };
