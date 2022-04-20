// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      currency: getCurrencyTypeFromString(json['currency'] as String?),
      isDefaultCurrency: json['isDefaultCurrency'] as bool?,
      isAvailable: json['isAvailable'] as bool?,
      isInvoiceable: json['isInvoiceable'] as bool?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'currency': getStringFromCurrencyType(instance.currency),
      'isDefaultCurrency': instance.isDefaultCurrency,
      'isAvailable': instance.isAvailable,
      'isInvoiceable': instance.isInvoiceable,
    };
