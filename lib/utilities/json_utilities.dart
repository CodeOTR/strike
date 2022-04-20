DateTime? getDateFromTimestamp(dynamic timestamp) {
  if (timestamp is int) {
    return DateTime.fromMicrosecondsSinceEpoch(timestamp);
  } else if (timestamp is String) {
    return DateTime.parse(timestamp);
  } else {
    return null;
  }
}

String? getStringFromDateTime(DateTime? dateTime) {
  if (dateTime != null) {
    return dateTime.toUtc().toIso8601String();
  }
  return null;
}

double? getDoubleFromString(String? string) {
  if (string != null) return double.tryParse(string);
  return null;
}

String? getStringFromDouble(double? double) {
  return double.toString();
}
