import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable(explicitToJson: true)
class Currency {
  String? currency;

  bool? isDefaultCurrency;

  bool? isAvailable;

  bool? isInvoiceable;

  Currency({
    this.currency,
    this.isDefaultCurrency,
    this.isAvailable,
    this.isInvoiceable,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
