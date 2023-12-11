const List<String> moderationCategories = [
  "sexual",
  "hate",
  "harassment",
  "self-harm",
  "sexual/minors",
  "hate/threatening",
  "violence/graphic",
  "self-harm/intent",
  "self-harm/instructions",
  "harassment/threatening",
  "violence",
];

class ModerationResults {
  final bool flagged;
  final Map<String, bool> categories;
  final Map<String, double> categoryScores;

  const ModerationResults({
    required this.flagged,
    required this.categories,
    required this.categoryScores,
  });

  factory ModerationResults.fromJSON(Map<String, dynamic> json) {
    Map<String, dynamic> categories =
        json['categories'] as Map<String, dynamic>;
    Map<String, dynamic> categoryScores =
        json['category_scores'] as Map<String, dynamic>;

    return ModerationResults(
      flagged: json['flagged'] as bool,
      categories: categories.map((key, value) => MapEntry(key, value as bool)),
      categoryScores:
          categoryScores.map((key, value) => MapEntry(key, value as double)),
    );
  }
}
