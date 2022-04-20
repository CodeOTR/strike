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
  };

  Map<String, String> get _headers {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
    }..addAll(extraHeaders);
  }

  Future<http.Response> get({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.get(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers..addAll(extraHeaders ?? {}),
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> post({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.post(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: body,
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> put({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.put(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: body,
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> patch({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.patch(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: body,
    );

    printResponseData(response, endpoint);

    return response;
  }

  Future<http.Response> delete({
    required String strikeEndpoint,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? body,
  }) async {
    String endpoint = _host + strikeEndpoint;

    final response = await http.delete(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers..addAll(extraHeaders ?? {}),
      body: body,
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
    http.Response response = await get(strikeEndpoint: endpoints[StrikeEndpoint.invoices]!);

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
    http.Response response = await get(strikeEndpoint: endpoints[StrikeEndpoint.invoices]! + '/$id');

    try {
      final Invoice invoice = Invoice.fromJson(jsonDecode(response.body));

      return invoice;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }

  Future<Invoice?> issueInvoice({
    required String handle,
    required String description,
  }) async {
    http.Response response = await post(strikeEndpoint: endpoints[StrikeEndpoint.invoices]! + '/handle/$handle');

    try {
      final Invoice invoice = Invoice.fromJson(jsonDecode(response.body));

      return invoice;
    } catch (e) {
      debugPrint('Strike Error: ' + e.toString());
    }

    return null;
  }
}

enum StrikeEndpoint {
  newSubscription,
  invoices,
}
