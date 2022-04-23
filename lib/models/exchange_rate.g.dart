// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) => ExchangeRate(
      amount: getDoubleFromString(json['amount'] as String?),
      sourceCurrency:
          getCurrencyTypeFromString(json['sourceCurrency'] as String?),
      targetCurrency:
          getCurrencyTypeFromString(json['targetCurrency'] as String?),
    );

Map<String, dynamic> _$ExchangeRateToJson(ExchangeRate instance) =>
    <String, dynamic>{
      'amount': getStringFromDouble(instance.amount),
      'sourceCurrency': getStringFromCurrencyType(instance.sourceCurrency),
      'targetCurrency': getStringFromCurrencyType(instance.targetCurrency),
    };
