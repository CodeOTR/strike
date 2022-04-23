import 'package:example/app/styles.dart';
import 'package:example/app/widgets.dart';
import 'package:example/invoices/invoice_quote.dart';
import 'package:example/main.dart';
import 'package:example/users/user_search.dart';
import 'package:flutter/material.dart';
import 'package:strike/models/invoice.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Details'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                DetailsTile(label: 'Invoice ID', value: invoice.invoiceId ?? ''),
                const Divider(),
                DetailsTile(label: 'Correlation ID', value: invoice.correlationId ?? ''),
                const Divider(),
                DetailsTile(
                  label: 'Issuer ID',
                  value: invoice.issuerId ?? '',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserSearch(id: invoice.issuerId),
                    ));
                  },
                ),
                const Divider(),
                DetailsTile(
                  label: 'Receiver ID',
                  value: invoice.receiverId ?? '',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserSearch(id: invoice.issuerId),
                    ));
                  },
                ),
                const Divider(),
                DetailsTile(label: 'Description', value: invoice.description ?? ''),
                const Divider(),
                DetailsTile(label: 'Created', value: invoice.created.toString()),
                gap16,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                      child: Text(
                    invoice.state?.name ?? '',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: invoice.state?.stateColor,
                    ),
                  )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                child: const Text('Generate Quote'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceQuote(invoice: invoice)));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
