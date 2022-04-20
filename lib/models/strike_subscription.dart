import 'package:json_annotation/json_annotation.dart';

part 'strike_subscription.g.dart';

@JsonSerializable(explicitToJson: true)
class StrikeSubscription {
  String? id;

  String? webhookUrl;

  String? webhookVersion;

  bool? enabled;

  DateTime? created;

  List<String>? eventTypes;

  StrikeSubscription({
    this.id,
    this.webhookUrl,
    this.webhookVersion,
    this.enabled,
    this.created,
    this.eventTypes,
  });

  factory StrikeSubscription.fromJson(Map<String, dynamic> json) => _$StrikeSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$StrikeSubscriptionToJson(this);
}
