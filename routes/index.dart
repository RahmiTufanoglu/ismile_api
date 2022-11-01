import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../models/index.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final emojiStatus = context.read<EmojiStatus>();

  return Response.json(
    body: emojiStatus.toJson(),
  );
}

Future<Response> _post(RequestContext context) async {
  final emojiStatus = context.read<EmojiStatus>();
  //final data = EmojiStatus.fromJson(await context.request.json());

  final body = await context.request.json();

  return Response.json(
    statusCode: HttpStatus.created,
    body: body,
    //body: <String, dynamic>{},
  );
}

Future<String> foo() async {
  return '';
}

/// Start server: dart_frog dev
//Future<Response> onRequest(RequestContext context) async {
//  // Access the incoming request.
//  final request = context.request;
//
//  // Access the query parameters as a `Map<String, String>`.
//  final params = request.uri.queryParameters;
//
//  // Get the value for the key `name`.
//  // Default to `there` if there is no query parameter.
//  // Example: http://localhost:8080/?name=Rahmi
//  final name = params['name'] ?? 'no_query_param';
//
//  // Access the request body as a `String`.
//  final body = await request.body();
//
//  // Output: Hi Rahmi
//  //return Response(body: 'Hi $name, Body $body');
//  /*return Response(
//    headers: {'hello': 'world'},
//    body: 'Hello World',
//  );*/
//  return Response.json(
//    body: <String, dynamic>{'hello': 'world'},
//  );
//}
