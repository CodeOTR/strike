library strike;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:strike/models/invoice.dart';
import 'package:strike/models/invoice_amount.dart';
import 'package:strike/models/profile.dart';
import 'package:strike/models/quote.dart';
import 'package:strike/models/strike_subscription.dart';
import 'package:http/http.dart' as http;

class Strike {
  Strike({
    required this.apiKey,
    this.extraHeaders = const {},
    this.debugMode = false,
  });

  final String apiKey;
  final Map<String, String> extraHeaders;
  final bool debugMode;

  var client = http.Client();

  static const String _host = 'https://api.strike.me/v1';

  static const Map<StrikeEndpoint, String> endpoints = {
    StrikeEndpoint.newSubscription: '/subscriptions',
    StrikeEndpoint.invoices: '/invoices',
    StrikeEndpoint.accounts: '/accounts',
  };

  Map<String, String> get _headers {
    return {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
    }..addAll(extraHeaders);
  }

  Future<http.Response> _get({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.get(
      Uri.parse(endpoint),
      headers: _headers..addAll(extraHeaders ?? {}),
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> _post({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.post(
      Uri.parse(endpoint),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: jsonEncode(body),
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> _put({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.put(
      Uri.parse(endpoint),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: jsonEncode(body),
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> _patch({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.patch(
      Uri.parse(endpoint),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: jsonEncode(body),
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> _delete({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.delete(
      Uri.parse(endpoint),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: jsonEncode(body),
    );

    printResponseData(response, endpoint);

    return response;
  }

  void printResponseData(http.Response response, String endpoint) {
    if (debugMode) {
      debugPrint('Endpoint: ' + endpoint);
      debugPrint('Status code: ' + response.statusCode.toString());
      debugPrint('Response body: ' + response.body);
    }
  }

  StrikeSubscription? createNewSubscription() {
    return null;

    // http.post(url)
  }

  Future<List<Invoice>?> getInvoices() async {
    http.Response response = await _get(strikeEndpoint: endpoints[StrikeEndpoint.invoices]!);

    final List data = jsonDecode(response.body);

    List<Invoice> invoices = [];

    try {
      for (var value in data) {
        Invoice invoice = Invoice.fromJson(value);
        invoices.add(invoice);
      }
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return invoices;
  }

  Future<Invoice?> findInvoiceById({required String id}) async {
    http.Response response = await _get(strikeEndpoint: endpoints[StrikeEndpoint.invoices]! + '/$id');

    try {
      final Invoice invoice = Invoice.fromJson(jsonDecode(response.body));

      return invoice;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }

  Future<Invoice?> issueInvoice({
    required String? handle,
    required String correlationId,
    required String description,
    required InvoiceAmount invoiceAmount,
  }) async {
    String endpoint = endpoints[StrikeEndpoint.invoices]! + (handle != null ? '/handle/$handle' : '');

    http.Response response = await _post(
      strikeEndpoint: endpoint,
      extraHeaders: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: {'correlationId': correlationId, 'description': description, 'amount': invoiceAmount.toJson()},
    );

    try {
      final Invoice invoice = Invoice.fromJson(jsonDecode(response.body));

      return invoice;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }

  Future<Quote?> issueQuoteForInvoice({required String? invoiceId}) async {
    http.Response response = await _post(
      strikeEndpoint: endpoints[StrikeEndpoint.invoices]! + '/$invoiceId/quote',
      extraHeaders: {
        HttpHeaders.contentLengthHeader: '0',
      },
    );

    try {
      final Quote quote = Quote.fromJson(jsonDecode(response.body));

      return quote;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }

  Future<Invoice?> cancelUnpaidInvoice({required String? invoiceId}) async {
    http.Response response = await _patch(
      strikeEndpoint: endpoints[StrikeEndpoint.invoices]! + '/$invoiceId/cancel',
    );

    try {
      final Invoice invoice = Invoice.fromJson(jsonDecode(response.body));

      return invoice;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }

  Future<Profile?> getProfileById({required String id}) async {
    http.Response response = await _get(strikeEndpoint: endpoints[StrikeEndpoint.accounts]! + '/$id/profile');

    try {
      final Profile profile = Profile.fromJson(jsonDecode(response.body));

      return profile;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }

  Future<Profile?> getProfileByHandle({required String handle}) async {
    http.Response response = await _get(strikeEndpoint: endpoints[StrikeEndpoint.accounts]! + '/handle/$handle/profile');

    try {
      final Profile profile = Profile.fromJson(jsonDecode(response.body));

      return profile;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }
}

enum StrikeEndpoint {
  newSubscription,
  invoices,
  accounts,
}
