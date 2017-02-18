library install_interceptors;

import 'dart:async';

import 'package:redstone/redstone.dart';
import 'package:shelf/shelf.dart' as shelf;

@Interceptor("/.+")
Future<shelf.Response> interceptor() async {
  var response = await chain.next();
  var responseString = await response.readAsString();
  return new shelf.Response.ok("interceptor_1 $responseString");
}
