<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package is a pure Dart SDK wrapper for the Strike APIs ([offical docs](https://docs.strike.me/)).
Strike APIs enable you to accept payments securely and integrate your app with [Strike](https://strike.me/en/).

## Roadmap

- [x] Find user profiles by handle
- [x] Find user profiles by ID
- [x] Issue basic invoice 
- [x] Issue invoice to specific receiver
- [x] Find invoice by ID
- [x] Issue quote for invoice
- [x] Cancel unpaid invoice
- [x] Get currency exchange rates
- [ ] Get webhook events
- [ ] Find webhook events by ID
- [ ] Get webhook subscriptions
- [ ] Create new webhook subscriptions
- [ ] Find webhook subscription by ID
- [ ] Update webhook subscription
- [ ] Delete webhook subscription

## Getting started

In order to use the Strike API, you will need to [request an API key](https://developer.strike.me/en/).

## Secure your API Key
You can use the [flutter_dotenv](https://pub.dev/packages/flutter_dotenv "flutter_dotenv") package to keep your API key safely out of public repositories.
1. Add flutter_dotenv to your pubspec.yaml
2. Add \*.env to your project's .gitignore file
3. Create a .env file in the root of your project and add the following contents
```yaml
STRIKE_API_KEY=<YOUR_API_KEY>
```
4. Add the .env file to the assets section of your pubspec.yaml and run flutter pub get
```yaml
assets:
  - .env
```
## Usage
Create your Strike instance.

Without flutter_dotenv:

```dart
Strike _strike = Strike(apiKey: '<YOUR_API_KEY>');
```
With flutter_dotenv:

```dart
await dotenv.load(fileName: '.env');

Strike _strike = Strike(apiKey:dotenv.env['STRIKE_API_KEY']!);
```

## Issue an Invoice
The only thing *required* to issue an invoice is an InvoiceAmount (which includes the quantity and type of currency being requested). All other fields are optional.

### Issue an Invoice for Yourself
```dart
await strike.issueInvoice(
  handle: null,
  correlationId: null,
  description: null,
  invoiceAmount: InvoiceAmount(
     amount: 10,
     currency: CurrencyType.USD,
  ),
);
```
When you issue an invoice without specifying a receiver, the invoice is created with your own personal Strike ID as both the "Issuer" and the "Receiver". In other words, when this invoice is paid, you receive the funds.

### Issue an Invoice for Someone Else
```dart
await strike.issueInvoice(
  handle: '<RECEIVER_HANDLE>',
  correlationId: null,
  description: "Nice work!",
  invoiceAmount: InvoiceAmount(
     amount: 1,
     currency: CurrencyType.BTC,
  ),
);
```

## Support
[:heart: Sponsor on GitHub](https://github.com/sponsors/jtmuller5) 

<a href="https://buymeacoffee.com/mullr" target="_blank"><img align="left" src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
