import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/currency.dart';
import 'package:strike/utilities/json_utilities.dart';

part 'conversion_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class ConversionRate {

  @JsonKey(fromJson: getDoubleFromString, toJson: getStringFromDouble)
  double? amount;

  @JsonKey(fromJson: getCurrencyTypeFromString, toJson: getStringFromCurrencyType)
  CurrencyType? sourceCurrency;

  @JsonKey(fromJson: getCurrencyTypeFromString, toJson: getStringFromCurrencyType)
  CurrencyType? targetCurrency;

  ConversionRate({
    this.amount,
    this.sourceCurrency,
    this.targetCurrency,
  });

  factory ConversionRate.fromJson(Map<String, dynamic> json) => _$ConversionRateFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionRateToJson(this);
}
