import 'package:storyteller/models/completion_results.dart';
import 'package:storyteller/models/completion_usage.dart';

class Completion {
  final String id;
  final String object;
  final int created;
  final String model;
  final CompletionResults choices;
  final CompletionUsage usage;
  final String systemFingerprint;

  const Completion({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.systemFingerprint,
  });

  factory Completion.fromJSON(Map<String, dynamic> json) {
    var choices = json['choices'] as List;

    return Completion(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      model: json['model'] as String,
      choices: CompletionResults.fromJSON(choices[0]),
      usage: CompletionUsage.fromJSON(json['usage'] as Map<String, dynamic>),
      systemFingerprint: json['system_fingerprint'] as String,
    );
  }
}
