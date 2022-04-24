import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:strike/models/exchange_rate.dart';
import 'package:strike/models/invoice_amount.dart';
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

  Future<void> openStrikeApp({String? invoiceId}) async {
    try {
      if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
        try {
          bool launchable = await canLaunchUrl(Uri.parse('lightning:$lnInvoice'));
          if (launchable) launchUrl(Uri.parse('lightning:$lnInvoice'));
        } catch (e) {
          debugPrint('Couldn\'t launch url: ' + e.toString());
          rethrow;
        }
      } else {
        if (invoiceId != null) {
          try {
            bool launchable = await canLaunchUrl(Uri.parse('https://strike.me/pay/$invoiceId/lightning:$lnInvoice'));
            if (launchable) {
              launchUrl(
                Uri.parse('https://strike.me/pay/$invoiceId/lightning:$lnInvoice'),
                webOnlyWindowName: '_blank',
              );
            }
          } catch (e) {
            debugPrint('Couldn\'t launch url: ' + e.toString());
            rethrow;
          }
        }
      }
    } catch (e) {
      debugPrint('Couldn\'t launch url: ' + e.toString());
      launchUrl(Uri.parse('https://invite.strike.me/WYJFFO'));
    }
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
