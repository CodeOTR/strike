import 'package:json_annotation/json_annotation.dart';
import 'package:strike/utilities/json_utilities.dart';

part 'strike_event.g.dart';

@JsonSerializable(explicitToJson: true)
class StrikeEvent {
  String? id;

  String? eventType;

  // v1
  String? webhookVersion;

  @JsonKey(fromJson: getDateFromTimestamp, toJson: getStringFromDateTime)
  DateTime? created;

  bool? deliverySuccess;

  dynamic data;

  StrikeEvent({
    this.id,
    this.eventType,
    this.webhookVersion,
    this.created,
    this.deliverySuccess,
    this.data,
  });

  factory StrikeEvent.fromJson(Map<String, dynamic> json) => _$StrikeEventFromJson(json);

  Map<String, dynamic> toJson() => _$StrikeEventToJson(this);
}
