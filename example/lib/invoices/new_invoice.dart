import 'package:example/app/widgets.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:strike/models/profile_currency.dart';
import 'package:strike/models/invoice.dart';
import 'package:strike/models/invoice_amount.dart';

class NewInvoice extends StatefulWidget {
  const NewInvoice({Key? key}) : super(key: key);

  @override
  State<NewInvoice> createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController handleController = TextEditingController();

  CurrencyType? selectedCurrencyType;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: '(Optional) Handle'),
                controller: handleController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Invoice Description'),
                controller: descriptionController,
              ),
              gap16,
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                children: [
                  for (CurrencyType type in CurrencyType.values)
                    InputChip(
                      selected: type == selectedCurrencyType,
                      label: Text(type.name),
                      onPressed: () {
                        setState(() {
                          selectedCurrencyType = type;
                        });
                      },
                    )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(selectedCurrencyType?.longName ?? ''),
              )
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
              amount: 10,
              currency: selectedCurrencyType,
            ),
          );
        },
      ),
    );
  }
}
