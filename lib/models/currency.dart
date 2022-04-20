import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'currency.g.dart';

@JsonSerializable(explicitToJson: true)
class Currency {
  @JsonKey(fromJson: getCurrencyTypeFromString, toJson: getStringFromCurrencyType)
  CurrencyType? currency;

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

CurrencyType? getCurrencyTypeFromString(String? string) {
  return CurrencyType.values.firstWhereOrNull((element) => element.name == string);
}

String? getStringFromCurrencyType(CurrencyType? currencyType) {
  return currencyType?.name;
}

enum CurrencyType {
  BTC,
  USD,
  EUR,
  USDT,
  GBP,
}
