import 'package:example/app/styles.dart';
import 'package:example/app/widgets.dart';
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('ID', style: bold),
          Text(invoice.invoiceId ?? ''),
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
          DetailsTile(label: 'Receiver ID', value: invoice.receiverId ?? '',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserSearch(id: invoice.issuerId),
              ));
            },),
          const Divider(),
          const Text('Description', style: bold),
          Text(invoice.description ?? ''),
        ],
      ),
    );
  }
}
