import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/currency.dart';

part 'account.g.dart';

@JsonSerializable(explicitToJson: true)
class Account {
  String? handle;

  bool? canReceive;

  List<Currency>? currencies;

  Account({
    this.handle,
    this.canReceive,
    this.currencies,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
