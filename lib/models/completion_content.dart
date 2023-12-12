class CompletionContent {
  final String history;
  final String illustration;

  CompletionContent({
    required this.history,
    required this.illustration,
  });

  factory CompletionContent.fromJSON(Map<String, dynamic> json) {
    return CompletionContent(
      history: json['history'] as String,
      illustration: json['illustration'] as String,
    );
  }
}
