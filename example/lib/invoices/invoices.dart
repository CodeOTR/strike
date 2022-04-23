import 'package:example/invoices/invoice_details.dart';
import 'package:example/invoices/new_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:strike/models/invoice.dart';
import 'package:strike/strike.dart';

class Invoices extends StatelessWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Strike _strike = Strike(
      apiKey: dotenv.env['STRIKE_API_KEY']!,
      debugMode: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
      ),
      body: FutureBuilder(
        future: _strike.getInvoices(),
        builder: (BuildContext context, AsyncSnapshot<List<Invoice>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Invoice invoice = snapshot.data![index];

                  return ListTile(
                    title: Text(invoice.invoiceId.toString()),
                    subtitle: Text((invoice.amount?.amount ?? 0).toString() + ' ' + (invoice.amount?.currency?.name ?? '')),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InvoiceDetails(invoice: invoice),
                      ));
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No Invoices'),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewInvoice(),
          ));
        },
      ),
    );
  }
}
