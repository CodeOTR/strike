// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceAmount _$InvoiceAmountFromJson(Map<String, dynamic> json) =>
    InvoiceAmount(
      currency: $enumDecodeNullable(_$CurrencyTypeEnumMap, json['currency']),
      amount: getDoubleFromString(json['amount'] as String?),
    );

Map<String, dynamic> _$InvoiceAmountToJson(InvoiceAmount instance) =>
    <String, dynamic>{
      'currency': _$CurrencyTypeEnumMap[instance.currency],
      'amount': getStringFromDouble(instance.amount),
    };

const _$CurrencyTypeEnumMap = {
  CurrencyType.BTC: 'BTC',
  CurrencyType.USD: 'USD',
  CurrencyType.EUR: 'EUR',
  CurrencyType.USDT: 'USDT',
  CurrencyType.GBP: 'GBP',
};
