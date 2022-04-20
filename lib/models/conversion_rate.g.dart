// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversionRate _$ConversionRateFromJson(Map<String, dynamic> json) =>
    ConversionRate(
      amount: getDoubleFromString(json['amount'] as String?),
      sourceCurrency: json['sourceCurrency'] as String?,
      targetCurrency: json['targetCurrency'] as String?,
    );

Map<String, dynamic> _$ConversionRateToJson(ConversionRate instance) =>
    <String, dynamic>{
      'amount': getStringFromDouble(instance.amount),
      'sourceCurrency': instance.sourceCurrency,
      'targetCurrency': instance.targetCurrency,
    };
