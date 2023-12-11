import 'package:storyteller/models/completion_message.dart';

class CompletionResults {
  final int index;
  final CompletionMessage message;
  final String finishReason;

  CompletionResults({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  factory CompletionResults.fromJSON(Map<String, dynamic> json) {
    return CompletionResults(
      index: json['index'] as int,
      message:
          CompletionMessage.fromJSON(json['message'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String,
    );
  }
}
