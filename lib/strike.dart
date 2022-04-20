library strike;

import 'dart:io';

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

  Future<http.Response> get(StrikeEndpoint endpoint) async {
    return await http.get(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
    );
  }

  Future<http.Response> post(StrikeEndpoint endpoint, Map body) async {
    return await http.post(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );
  }

  Future<http.Response> put(StrikeEndpoint endpoint, Map body) async {
    return await http.put(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );
  }

  Future<http.Response> patch(StrikeEndpoint endpoint, Map body) async {
   return await http.patch(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );
  }

  Future<http.Response> delete(StrikeEndpoint endpoint, Map body) async {
    return await http.delete(
      Uri.parse(_host + endpoints[endpoint]!),
      headers: _headers,
      body: body,
    );
  }

  StrikeSubscription? createNewSubscription() {
    // http.post(url)
  }

  Invoice? getInvoices(){
    
  }
}

enum StrikeEndpoint {
  newSubscription,
  invoices,
}
