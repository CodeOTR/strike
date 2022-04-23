// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCurrency _$ProfileCurrencyFromJson(Map<String, dynamic> json) =>
    ProfileCurrency(
      currency: $enumDecodeNullable(_$CurrencyTypeEnumMap, json['currency']),
      isDefaultCurrency: json['isDefaultCurrency'] as bool?,
      isAvailable: json['isAvailable'] as bool?,
      isInvoiceable: json['isInvoiceable'] as bool?,
    );

Map<String, dynamic> _$ProfileCurrencyToJson(ProfileCurrency instance) =>
    <String, dynamic>{
      'currency': _$CurrencyTypeEnumMap[instance.currency],
      'isDefaultCurrency': instance.isDefaultCurrency,
      'isAvailable': instance.isAvailable,
      'isInvoiceable': instance.isInvoiceable,
    };

const _$CurrencyTypeEnumMap = {
  CurrencyType.BTC: 'BTC',
  CurrencyType.USD: 'USD',
  CurrencyType.EUR: 'EUR',
  CurrencyType.USDT: 'USDT',
  CurrencyType.GBP: 'GBP',
};
