import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:strike/models/invoice.dart';
import 'package:strike/models/invoice_amount.dart';

class NewInvoice extends StatefulWidget {
  NewInvoice({Key? key}) : super(key: key);

  @override
  State<NewInvoice> createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController handleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Invoice'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: '(Optional) Handle'),
                controller: handleController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Invoice Description'),
                controller: descriptionController,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () async {
          Invoice? newInvoice = await strike.issueInvoice(
            handle: handleController.text,
            correlationId: null,
            description: descriptionController.text,
            invoiceAmount: InvoiceAmount(
              amount: ,
              currency: ,
            ),
          );
        },
      ),
    );
  }
}
