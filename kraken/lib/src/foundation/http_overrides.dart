/*
 * Copyright (C) 2021-present Alibaba Inc. All rights reserved.
 * Author: Kraken Team.
 */
import 'dart:io';
import 'package:kraken/launcher.dart';
import 'http_client_interceptor.dart';
import 'http_client.dart';

// TODO: do not use header to mark context
const String HttpHeaderContext = 'x-context';
class KrakenHttpOverrides extends HttpOverrides {
  static KrakenHttpOverrides? _instance;
  KrakenHttpOverrides._();

  factory KrakenHttpOverrides.instance() {
    if (_instance == null) {
      _instance = KrakenHttpOverrides._();
    }
    return _instance!;
  }

  static String? getContextHeader(HttpClientRequest request) {
    String? contextId = request.headers.value(HttpHeaderContext);
    return contextId;
  }

  static void setContextHeader(HttpClientRequest request, String contextId) {
    request.headers.set(HttpHeaderContext, contextId);
  }

  final HttpOverrides? parentHttpOverrides = HttpOverrides.current;
  final Map<String, HttpClientInterceptor> _contextIdToHttpClientInterceptorMap = Map<String, HttpClientInterceptor>();

  void registerKrakenContext(KrakenController controller, HttpClientInterceptor httpClientInterceptor) {
    String contextId = controller.view.contextId.toString();
    _contextIdToHttpClientInterceptorMap[contextId] = httpClientInterceptor;
  }

  void unregisterKrakenContext(KrakenController controller) {
    String contextId = controller.view.contextId.toString();
    // Returns true if [value] was in the map, false otherwise.
    _contextIdToHttpClientInterceptorMap.remove(contextId);
  }

  bool hasInterceptor(String contextId) {
    return _contextIdToHttpClientInterceptorMap.containsKey(contextId);
  }

  HttpClientInterceptor getInterceptor(String contextId) {
    return _contextIdToHttpClientInterceptorMap[contextId]!;
  }

  void clearInterceptors() {
    _contextIdToHttpClientInterceptorMap.clear();
  }

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    HttpClient nativeHttpClient;
    if (parentHttpOverrides != null) {
      nativeHttpClient = parentHttpOverrides!.createHttpClient(context);
    } else {
      nativeHttpClient = super.createHttpClient(context);
    }

    HttpClient httpClient = ProxyHttpClient(
      nativeHttpClient: nativeHttpClient,
      httpOverrides: this,
    );
    return httpClient;
  }

  @override
  String findProxyFromEnvironment(Uri url, Map<String, String>? environment) {
    if (parentHttpOverrides != null) {
      return parentHttpOverrides!.findProxyFromEnvironment(url, environment);
    } else {
      return super.findProxyFromEnvironment(url, environment);
    }
  }
}

KrakenHttpOverrides setupHttpOverrides(HttpClientInterceptor? httpClientInterceptor, { required KrakenController controller }) {

  KrakenHttpOverrides httpOverrides = KrakenHttpOverrides.instance();

  if (httpClientInterceptor != null) {
    httpOverrides.registerKrakenContext(controller, httpClientInterceptor);
  }

  HttpOverrides.global = httpOverrides;
  return httpOverrides;
}

