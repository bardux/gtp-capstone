import 'dart:convert';

import 'package:storyteller/models/completion_content.dart';

class CompletionMessage {
  final String role;
  final CompletionContent content;

  CompletionMessage({
    required this.role,
    required this.content,
  });

  factory CompletionMessage.fromJSON(Map<String, dynamic> json) {
    return CompletionMessage(
      role: json['role'] as String,
      content:
          CompletionContent.fromJSON(jsonDecode(json['content'] as String)),
    );
  }
}
