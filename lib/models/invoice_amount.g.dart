// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceAmount _$InvoiceAmountFromJson(Map<String, dynamic> json) =>
    InvoiceAmount(
      currency: getCurrencyTypeFromString(json['currency'] as String?),
      amount: getDoubleFromString(json['amount'] as String?),
    );

Map<String, dynamic> _$InvoiceAmountToJson(InvoiceAmount instance) =>
    <String, dynamic>{
      'currency': getStringFromCurrencyType(instance.currency),
      'amount': getStringFromDouble(instance.amount),
    };
