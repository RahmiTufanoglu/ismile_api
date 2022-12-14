import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../models/emoji_status.dart';
import '../models/emoji_status_data_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get2(context);
    case HttpMethod.post:
      return _post2(context);
    case HttpMethod.put:
      return _put2(context);
    case HttpMethod.patch:
      return _patch(context);
    case HttpMethod.delete:
      return _delete2(context);
    case HttpMethod.head:
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _put(RequestContext context, String id, EmojiStatus emojiStatus) async {
  final dataSource = context.read<EmojiStatusDataSource>();
  final updatedEmojiStatus = EmojiStatus.fromJson(await context.request.json());
  final newTodo = await dataSource.update(
    id,
    //EmojiStatus(status: updatedEmojiStatus.status),
    emojiStatus.copyWith(
      status: updatedEmojiStatus.status,
    ),
    //todo.copyWith(
    //  title: updatedEmojiStatus.title,
    //  description: updatedEmojiStatus.description,
    //  isCompleted: updatedEmojiStatus.isCompleted,
    //),
  );

  return Response.json(body: newTodo);
}

Future<Response> _delete(RequestContext context, String id) async {
  final dataSource = context.read<EmojiStatusDataSource>();
  await dataSource.delete(id);
  return Response(statusCode: HttpStatus.noContent);
}

Future<Response> _get2(RequestContext context) async {
  final emojiStatusDataSource = context.read<EmojiStatusDataSource>();
  final data = emojiStatusDataSource.readAll();
  return Response.json(body: data);

  final emojiStatus = context.read<EmojiStatus>();

  final uri = context.request.uri;
  final method = context.request.method;
  final connectionInfo = context.request.connectionInfo;
  print('uri: $uri'); // uri: http://localhost:8080/
  print('method: $method'); // method: HttpMethod.get
  print('localPort: ${connectionInfo.localPort}'); // localPort: 8080

  final queryParametersAll = uri.queryParametersAll;
  print('queryParametersAll: $queryParametersAll');
  // http://localhost:8080?name=Rahmi
  // queryParametersAll: {name: [Rahmi]}
  // http://localhost:8080?name=Rahmi&age=31
  // queryParametersAll: {name: [Rahmi], age: [31]}

  final queryParameters = uri.queryParameters;
  print('queryParameters: $queryParameters');
  // queryParameters: {name: Rahmi, age: 31}

  final query = uri.query;
  print('query: $query');
  // query: name=Rahmi&age=31

  return Response.json(body: emojiStatus.toJson());
}

Future<Response> _post2(RequestContext context) async {
  final body = await context.request.json();

  return Response.json(body: body);
}

Future<Response> _put2(RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the query parameters as a `Map<String, String>`.
  final params = request.uri.queryParameters;

  // Get the value for the key `name`.
  // Default to `there` if there is no query parameter.
  // Example: http://localhost:8080/?name=Rahmi
  final name = params['name'] ?? 'no_query_param';

  // Access the request body as a `String`.
  final body = await request.body();

  return Response(body: 'Hi $name, Body $body');
}

Future<Response> _patch(RequestContext context) async {
  return Response(body: 'patch');
}

Future<Response> _delete2(RequestContext context) async {
  return Response(body: 'delete');
}
