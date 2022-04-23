// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) => ExchangeRate(
      amount: getDoubleFromString(json['amount'] as String?),
      sourceCurrency:
          $enumDecodeNullable(_$CurrencyTypeEnumMap, json['sourceCurrency']),
      targetCurrency:
          $enumDecodeNullable(_$CurrencyTypeEnumMap, json['targetCurrency']),
    );

Map<String, dynamic> _$ExchangeRateToJson(ExchangeRate instance) =>
    <String, dynamic>{
      'amount': getStringFromDouble(instance.amount),
      'sourceCurrency': _$CurrencyTypeEnumMap[instance.sourceCurrency],
      'targetCurrency': _$CurrencyTypeEnumMap[instance.targetCurrency],
    };

const _$CurrencyTypeEnumMap = {
  CurrencyType.BTC: 'BTC',
  CurrencyType.USD: 'USD',
  CurrencyType.EUR: 'EUR',
  CurrencyType.USDT: 'USDT',
  CurrencyType.GBP: 'GBP',
};
