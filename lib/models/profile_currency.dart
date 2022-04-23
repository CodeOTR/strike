import 'package:json_annotation/json_annotation.dart';

part 'profile_currency.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileCurrency {
  CurrencyType? currency;

  bool? isDefaultCurrency;

  bool? isAvailable;

  bool? isInvoiceable;

  ProfileCurrency({
    this.currency,
    this.isDefaultCurrency,
    this.isAvailable,
    this.isInvoiceable,
  });

  factory ProfileCurrency.fromJson(Map<String, dynamic> json) => _$ProfileCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCurrencyToJson(this);
}

enum CurrencyType {
  BTC,
  USD,
  EUR,
  USDT,
  GBP,
}

extension Extension on CurrencyType {
  String get longName {
    switch (this) {
      case CurrencyType.BTC:
        return 'Bitcoin';
      case CurrencyType.USD:
        return 'United States Dollar';
      case CurrencyType.EUR:
        return 'Euro';
      case CurrencyType.USDT:
        return 'United States Dollar Tether';
      case CurrencyType.GBP:
        return 'British Pound Sterling';
    }
  }
}
