import 'package:example/app/widgets.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:strike/models/invoice.dart';
import 'package:strike/models/quote.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoiceQuote extends StatelessWidget {
  const InvoiceQuote({Key? key, required this.invoice}) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    debugPrint('invoice id: ' + invoice.invoiceId.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote'),
      ),
      body: FutureBuilder(
        future: strike.issueQuoteForInvoice(invoiceId: invoice.invoiceId),
        builder: (context, AsyncSnapshot<Quote?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            debugPrint('snapshot.data: ' + snapshot.data.toString());
            if (snapshot.data != null) {
              Quote quote = snapshot.data!;

              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (quote.lnInvoice != null)
                    Center(
                      child: QrImage(
                        data: quote.lnInvoice!,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                  gap16,
                /*  Center(
                    child: OutlinedButton(
                      child: const Text('Open Strike'),
                      onPressed: () {
                       quote.openStrikeApp();
                      },
                    ),
                  ),*/
                  DetailsTile(label: 'Quote ID', value: quote.quoteId ?? ''),
                  const Divider(),
                  DetailsTile(label: 'Source Amount', value: quote.sourceAmount?.displayAmount() ?? ''),
                  const Divider(),
                  DetailsTile(label: 'Target Amount', value: quote.targetAmount?.displayAmount() ?? ''),
                  const Divider(),
                  DetailsTile(label: 'On-Chain Address', value: quote.onchainAddress ?? ''),
                  const Divider(),
                  DetailsTile(label: 'Expiration', value: quote.expiration.toString()),
                  const Divider(),
                  DetailsTile(label: 'Expiration in Seconds', value: quote.expirationInSec.toString()),
                  const Divider(),
                  DetailsTile(label: 'LN Invoice', value: quote.lnInvoice ?? ''),
                  const Divider(),
                ],
              );
            } else {
              return const Center(
                child: Text('No Results'),
              );
            }
          }
        },
      ),
    );
  }
}
