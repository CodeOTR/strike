import 'package:example/app/styles.dart';
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('ID', style: bold),
          Text(invoice.invoiceId ?? ''),
          const Divider(),
          const Text('Issuer ID', style: bold),
          Text(invoice.issuerId ?? ''),
          const Divider(),
          const Text('Receiver ID', style: bold),
          Text(invoice.receiverId ?? ''),
          const Divider(),
          const Text('Description', style: bold),
          Text(invoice.description ?? ''),
        ],
      ),
    );
  }
}
