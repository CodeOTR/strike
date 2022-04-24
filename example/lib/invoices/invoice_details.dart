import 'package:example/app/widgets.dart';
import 'package:example/invoices/invoice_quote.dart';
import 'package:example/main.dart';
import 'package:example/users/user_search.dart';
import 'package:flutter/material.dart';
import 'package:strike/models/invoice.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  final Invoice invoice;

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {

  Invoice? invoice;

  @override
  void initState() {
    super.initState();
    invoice = widget.invoice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                DetailsTile(label: 'Invoice ID', value: invoice?.invoiceId ?? ''),
                const Divider(),
                DetailsTile(label: 'Correlation ID', value: invoice?.correlationId ?? ''),
                const Divider(),
                DetailsTile(
                  label: 'Issuer ID',
                  value: invoice?.issuerId ?? '',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserSearch(id: invoice?.issuerId),
                    ));
                  },
                ),
                const Divider(),
                DetailsTile(
                  label: 'Receiver ID',
                  value: widget.invoice.receiverId ?? '',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserSearch(id: widget.invoice.issuerId),
                    ));
                  },
                ),
                const Divider(),
                DetailsTile(label: 'Description', value: invoice?.description ?? ''),
                const Divider(),
                DetailsTile(label: 'Created', value: invoice?.created.toString() ?? ''),
                gap16,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                      child: Text(
                    invoice?.state?.name ?? '',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: invoice?.state?.stateColor,
                    ),
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                OutlinedButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    Invoice? cancelledInvoice = await strike.cancelUnpaidInvoice(invoiceId: invoice?.invoiceId);

                    if(cancelledInvoice != null) {
                      setState(() {
                        invoice = cancelledInvoice;
                      });
                    }
                  },
                ),
                gap16,
                OutlinedButton(
                  child: const Text('Generate Quote'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceQuote(invoice: invoice!)));
                  },
                ),
                gap16,
                OutlinedButton(
                  child: const Text('Open Strike'),
                  onPressed: () {
                   invoice?.openStrikeApp();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
