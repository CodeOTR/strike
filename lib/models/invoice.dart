import 'package:flutter/material.dart';
import 'package:strike/models/invoice_amount.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:strike/utilities/json_utilities.dart';

part 'invoice.g.dart';

@JsonSerializable(explicitToJson: true)
class Invoice {
  String? invoiceId;

  InvoiceAmount? amount;

  /// Current state of the invoice
  /// UNPAID, PAID, PENDING, CANCELLED
  InvoiceState? state;

  @JsonKey(fromJson: getDateFromTimestamp, toJson: getStringFromDateTime)
  DateTime? created;

  String? correlationId;

  String? description;

  /// ID of your Strike account
  String? issuerId;

  /// ID of the tip receiver
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

enum InvoiceState {
  UNPAID,
  PAID,
  PENDING,
  CANCELLED,
}

extension Extension on InvoiceState {

  Color get stateColor {
    switch (this) {

      case InvoiceState.UNPAID:
        return Colors.grey;
      case InvoiceState.PAID:
        return Colors.green;
      case InvoiceState.PENDING:
        return Colors.orange;
      case InvoiceState.CANCELLED:
        return Colors.red;
    }
  }
}
