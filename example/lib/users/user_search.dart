import 'package:example/app/styles.dart';
import 'package:example/app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:strike/models/currency.dart';
import 'package:strike/models/profile.dart';
import 'package:strike/strike.dart';

class UserSearch extends StatefulWidget {
  UserSearch({Key? key}) : super(key: key);

  final Strike _strike = Strike(
    apiKey: dotenv.env['STRIKE_API_KEY']!,
    debugMode: true,
  );

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  final TextEditingController accountController = TextEditingController();
  Profile? profile;
  bool byHandle = true;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Search'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: accountController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                Profile? searchProfile = await widget._strike.getProfileByHandle(handle: accountController.text);
                setState(() {
                  profile = searchProfile;
                });
              },
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilterChip(
                label: const Text('Handle'),
                selected: byHandle,
                onSelected: (bool value) {
                  setState(() {
                    byHandle = true;
                  });
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('ID'),
                selected: !byHandle,
                onSelected: (bool value) {
                  setState(() {
                    byHandle = false;
                  });
                },
              )
            ],
          ),
          gap16,
          profile == null
              ? Container()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profile?.avatarUrl != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(profile!.avatarUrl!),
                                radius: 50,
                              )
                            : const CircleAvatar(),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Handle', style: bold),
                              Text(profile?.handle ?? ''),
                              const Divider(),
                              const Text('Description', style: bold),
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(child: Text(profile?.description ?? '')),
                                  ],
                                ),
                              ),
                              const Divider(),
                              const Text('Can Receive', style: bold),
                              Text((profile?.canReceive ?? false).toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                    gap16,
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Currencies',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: (profile?.currencies ?? []).length,
                      itemBuilder: (context, index) {
                        Currency currency = (profile?.currencies ?? [])[index];

                        String features = '';

                        if (currency.isAvailable ?? false) features += ' available';
                        if (currency.isInvoiceable ?? false) features += ' invoiceable';

                        return ListTile(
                          leading: (currency.isDefaultCurrency ?? false)
                              ? const Icon(Icons.check)
                              : const SizedBox(
                                  width: 24,
                                ),
                          title: Text(currency.currency!.name),
                          subtitle: Text(features.trim().replaceAll(' ', ', ')),
                        );
                      },
                    )
                  ],
                )
        ],
      ),
    );
  }

  @override
  void dispose() {
    accountController.dispose();
    super.dispose();
  }
}
