import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:strike/models/invoice.dart';
import 'package:strike/models/quote.dart';

class InvoiceQuote extends StatelessWidget {
  const InvoiceQuote({Key? key, required this.invoice}) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
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
                    if (snapshot.data != null) {

                      Quote quote = snapshot.data!;

                      if(quote.lnInvoice != null) {
                        return QrImage(
                          data: quote.lnInvoice!,
                          version: QrVersions.auto,
                          size: 200.0,
                        );
                      }
                    } else {
                      return const Center(
                        child: Text('No Results'),
                      );
                    }
                  }
                },
              ),);

  }
}
