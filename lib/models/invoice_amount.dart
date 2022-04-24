import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/profile_currency.dart';
import 'package:strike/utilities/json_utilities.dart';

part 'invoice_amount.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceAmount {

  CurrencyType? currency;

  @JsonKey(fromJson: getDoubleFromString, toJson: getStringFromDouble)
  double? amount;

  String displayAmount(){
    return '$amount ${currency?.name}';
  }

  InvoiceAmount({
    this.currency,
    this.amount,
  });

  factory InvoiceAmount.fromJson(Map<String, dynamic> json) => _$InvoiceAmountFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceAmountToJson(this);
}
