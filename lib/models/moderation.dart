import 'package:storyteller/models/moderation_results.dart';

class Moderation {
  final String id;
  final String model;
  final ModerationResults results;

  const Moderation({
    required this.id,
    required this.model,
    required this.results,
  });

  factory Moderation.fromJSON(Map<String, dynamic> json) {
    var results = json['results'] as List;

    return Moderation(
      id: json['id'] as String,
      model: json['model'] as String,
      results: ModerationResults.fromJSON(results[0]),
    );
  }
}
