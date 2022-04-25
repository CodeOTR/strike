import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/exchange_rate.dart';
import 'package:strike/models/invoice_amount.dart';
import 'package:strike/strike.dart';
import 'package:strike/utilities/json_utilities.dart';
import 'package:url_launcher/url_launcher.dart';

part 'quote.g.dart';

@JsonSerializable(explicitToJson: true)
class Quote {
  String? quoteId;

  String? description;

  String? lnInvoice;

  String? onchainAddress;

  @JsonKey(fromJson: getDateFromTimestamp, toJson: getStringFromDateTime)
  DateTime? expiration;

  int? expirationInSec;

  InvoiceAmount? targetAmount;

  InvoiceAmount? sourceAmount;

  ExchangeRate? exchangeRate;

  /// Launches the platform-specific app store to the Strike app
  Future<void> openStrikeApp({String? invoiceId}) async {
    String intent = kIsWeb ? 'lightning:$lnInvoice' : 'strike:lightning:$lnInvoice';

    launchUrl(
      Uri.parse(intent),
      webOnlyWindowName: kIsWeb ? '_blank' : null,
      mode: LaunchMode.externalApplication
    ).onError(
      (error, stackTrace) {
        debugPrint('error: ' + error.toString());
        Strike.openInAppStore();
        return true;
      },
    );
  }

  Quote({
    this.quoteId,
    this.description,
    this.lnInvoice,
    this.onchainAddress,
    this.expiration,
    this.expirationInSec,
    this.targetAmount,
    this.sourceAmount,
    this.exchangeRate,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
