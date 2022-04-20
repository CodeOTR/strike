import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/conversion_rate.dart';
import 'package:strike/models/invoice_amount.dart';
import 'package:strike/utilities/json_utilities.dart';

part 'quote.g.dart';

@JsonSerializable(explicitToJson: true)
class Quote {
  String? quoteId;

  String? description;

  String? lnInvoice;

  String? onchainAddress;

  @JsonKey(fromJson: getDateFromTimestamp, toJson: getStringFromDateTime)
  DateTime? expiration;

  int? expirationInSec;

  InvoiceAmount? targetAmount;

  InvoiceAmount? sourceAmount;

  ConversionRate? conversionRate;

  Quote({
    this.quoteId,
    this.description,
    this.lnInvoice,
    this.onchainAddress,
    this.expiration,
    this.expirationInSec,
    this.targetAmount,
    this.sourceAmount,
    this.conversionRate,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
