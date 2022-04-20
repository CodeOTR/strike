// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      invoiceId: json['invoiceId'] as String?,
      amount: json['amount'] == null
          ? null
          : InvoiceAmount.fromJson(json['amount'] as Map<String, dynamic>),
      state: json['state'] as String?,
      created: getDateFromTimestamp(json['created']),
      correlationId: json['correlationId'] as String?,
      description: json['description'] as String?,
      issuerId: json['issuerId'] as String?,
      receiverId: json['receiverId'] as String?,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'amount': instance.amount?.toJson(),
      'state': instance.state,
      'created': getStringFromDateTime(instance.created),
      'correlationId': instance.correlationId,
      'description': instance.description,
      'issuerId': instance.issuerId,
      'receiverId': instance.receiverId,
    };
