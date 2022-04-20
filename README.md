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

This package is a pure Dart SDK wrapper for the Strike APIs.
Strike APIs enable you to accept payments securely and integrate your app with [Strike](https://strike.me/en/).

## Features

* Find Strike users by ID and handle
* Issue new invoices
* Issue quotes for invoices
* Cancel unpaid invoices

## Roadmap

- [x] Find user profiles by handle
- [x] Find user profiles by ID
- [x] Issue basic invoice 
- [x] Issue invoice to specific receiver
- [x] Find invoice by ID
- [x] Cancel unpaid invoice
- [ ] Get currency exchange rates
- [ ] Get webhook events
- [ ] Find webhook events by ID
- [ ] Get webhook subscriptions
- [ ] Create new webhook subscriptions
- [ ] Find webhook subscription by ID
- [ ] Update webhook subscription
- [ ] Delete webhook subscription

## Getting started

In order to use the Strike API, you will need to [request an API key](https://developer.strike.me/en/).

## Usage

```dart
Strike _strike = Strike(apiKey: '<YOUR_API_KEY>');

_strike.getProfileByHandle(handle: 'joemuller');
```
