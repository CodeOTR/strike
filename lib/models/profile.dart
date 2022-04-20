import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/currency.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  String? handle;

  String? avatarUrl;

  String? description;

  bool? canReceive;

  List<Currency>? currencies;

  Profile({
    this.handle,
    this.canReceive,
    this.currencies,
    this.avatarUrl,
    this.description,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
