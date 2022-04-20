import 'package:strike/models/invoice_amount.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:strike/utilities/json_utilities.dart';

part 'invoice.g.dart';

@JsonSerializable(explicitToJson: true)
class Invoice {
  String? invoiceId;

  InvoiceAmount? amount;

  // UNPAID, PAID, PENDING, CANCELLED
  String? state;

  @JsonKey(fromJson: getDateFromTimestamp, toJson: getStringFromDateTime)
  DateTime? created;

  String? correlationId;

  String? description;

  String? issuerId;

  String? receiverId;

  Invoice({
    this.invoiceId,
    this.amount,
    this.state,
    this.created,
    this.correlationId,
    this.description,
    this.issuerId,
    this.receiverId,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
