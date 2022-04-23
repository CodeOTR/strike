// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      quoteId: json['quoteId'] as String?,
      description: json['description'] as String?,
      lnInvoice: json['lnInvoice'] as String?,
      onchainAddress: json['onchainAddress'] as String?,
      expiration: getDateFromTimestamp(json['expiration']),
      expirationInSec: json['expirationInSec'] as int?,
      targetAmount: json['targetAmount'] == null
          ? null
          : InvoiceAmount.fromJson(
              json['targetAmount'] as Map<String, dynamic>),
      sourceAmount: json['sourceAmount'] == null
          ? null
          : InvoiceAmount.fromJson(
              json['sourceAmount'] as Map<String, dynamic>),
      exchangeRate: json['exchangeRate'] == null
          ? null
          : ExchangeRate.fromJson(json['exchangeRate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'quoteId': instance.quoteId,
      'description': instance.description,
      'lnInvoice': instance.lnInvoice,
      'onchainAddress': instance.onchainAddress,
      'expiration': getStringFromDateTime(instance.expiration),
      'expirationInSec': instance.expirationInSec,
      'targetAmount': instance.targetAmount?.toJson(),
      'sourceAmount': instance.sourceAmount?.toJson(),
      'exchangeRate': instance.exchangeRate?.toJson(),
    };
