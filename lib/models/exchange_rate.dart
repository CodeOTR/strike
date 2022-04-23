import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/currency.dart';
import 'package:strike/utilities/json_utilities.dart';

part 'exchange_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class ExchangeRate {

  @JsonKey(fromJson: getDoubleFromString, toJson: getStringFromDouble)
  double? amount;

  @JsonKey(fromJson: getCurrencyTypeFromString, toJson: getStringFromCurrencyType)
  CurrencyType? sourceCurrency;

  @JsonKey(fromJson: getCurrencyTypeFromString, toJson: getStringFromCurrencyType)
  CurrencyType? targetCurrency;

  ExchangeRate({
    this.amount,
    this.sourceCurrency,
    this.targetCurrency,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateToJson(this);
}
