import 'package:dart_frog/dart_frog.dart';

import '../models/emoji_status.dart';

EmojiStatus get _data {
  final statusList = <Status>[
    Status(emoji: '🥲', createdAt: DateTime(2012, 1, 3)),
    Status(emoji: '😇', createdAt: DateTime(2021, 12, 6)),
  ];
  final emojiStatus = EmojiStatus(status: statusList);
  return emojiStatus;
}

/// Middleware in Dart Frog allows you to execute code
/// before and after a request is processed.
/// You can modify the inbound request and outbound responses,
/// provide dependencies, and more.
Handler middleware(Handler handler) {
  return handler
      .use(requestLogger()) //
      .use(provider<EmojiStatus>((_) => _data));

  return (context) async {
    // Execute code before request is handled.

    // Forward the request to the respective handler.
    final response = await handler(context);

    // Execute code after request is handled.

    // Return a response.
    return response;
  };
}
