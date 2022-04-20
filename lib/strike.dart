library strike;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:strike/models/invoice.dart';
import 'package:strike/models/strike_subscription.dart';
import 'package:http/http.dart' as http;

class Strike {
  Strike({
    required this.apiKey,
    this.extraHeaders = const {},
  });

  final String apiKey;
  final Map<String, String> extraHeaders;

  var client = http.Client();

  static const String _host = 'https://api.strike.me/v1';

  static const Map<StrikeEndpoint, String> endpoints = {
    StrikeEndpoint.newSubscription: '/subscriptions',
    StrikeEndpoint.invoices: '/invoices',
  };

  Map<String, String> get _headers {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
    }..addAll(extraHeaders);
  }

  Future<http.Response> get(StrikeEndpoint strikeEndpoint) async {

    String endpoint = _host + endpoints[strikeEndpoint]!;

    final response = await http.get(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> post(StrikeEndpoint strikeEndpoint, Map body) async {

    String endpoint = _host + endpoints[strikeEndpoint]!;

    final response = await http.post(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> put(StrikeEndpoint strikeEndpoint, Map body) async {

    String endpoint = _host + endpoints[strikeEndpoint]!;

    final response = await http.put(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> patch(StrikeEndpoint strikeEndpoint, Map body) async {

    String endpoint = _host + endpoints[strikeEndpoint]!;

    final response = await http.patch(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> delete(StrikeEndpoint strikeEndpoint, Map body) async {
    String endpoint = _host + endpoints[strikeEndpoint]!;

    final response = await http.delete(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );

    printResponseData(response, endpoint);

    return response;
  }

  http.Response printResponseData(http.Response response, String endpoint) {
    debugPrint('Endpoint: ' + endpoint);
    debugPrint('Status code: ' + response.statusCode.toString());
    debugPrint('Response body: ' + response.body);

    return response;
  }

  StrikeSubscription? createNewSubscription() {
    // http.post(url)
  }

  Future<List<Invoice>?> getInvoices() async {
    http.Response response = await get(StrikeEndpoint.invoices);

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

  Future<Invoice?> getInvoice({required String id}) async {
    http.Response response = await get(StrikeEndpoint.invoices);

    try {
      final Invoice invoice = Invoice.fromJson(jsonDecode(response.body));

      List<Invoice> invoices = [];
      return invoice;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }
  }
}

enum StrikeEndpoint {
  newSubscription,
  invoices,
}
