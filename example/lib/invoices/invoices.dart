import 'package:example/invoices/invoice_details.dart';
import 'package:example/invoices/new_invoice.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:strike/models/invoice.dart';

class Invoices extends StatelessWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
      ),
      body: FutureBuilder(
        future: strike.getInvoices(),
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
                    subtitle: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(
                                text: (invoice.amount?.amount ?? 0).toString() + ' ' + (invoice.amount?.currency?.name ?? '')+' - '
                            ),
                            TextSpan(
                                text: (invoice.state?.name ?? ''),style: TextStyle(color: invoice.state?.stateColor, fontWeight:
                            FontWeight.w600)
                            ),
                          ]
                        ),
                        ),
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
            builder: (context) => const NewInvoice(),
          ));
        },
      ),
    );
  }
}
