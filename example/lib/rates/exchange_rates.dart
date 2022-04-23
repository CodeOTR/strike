import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:strike/models/exchange_rate.dart';

class ExchangeRates extends StatelessWidget {
  const ExchangeRates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchange Rates'),
      ),
      body: FutureBuilder(
        future: strike.getExchangeRates(),
        builder: (context, AsyncSnapshot<List<ExchangeRate>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data != null) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: (snapshot.data ?? []).length,
                itemBuilder: (context, index) {
                  ExchangeRate rate = snapshot.data![index];

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text('1', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                              Text(rate.sourceCurrency!.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        const Flexible(child: Text('=')),
                        Expanded(
                          flex: 3,
                            child: Column(
                              children: [
                                Text('${rate.amount}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                                Text(rate.targetCurrency!.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                              ],
                            ),),
                      ],
                    ),
                  );
                },
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
