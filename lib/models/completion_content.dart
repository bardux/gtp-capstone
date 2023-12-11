class CompletionContent {
  final String history;
  final List<String> illustrations;

  CompletionContent({
    required this.history,
    required this.illustrations,
  });

  factory CompletionContent.fromJSON(Map<String, dynamic> json) {
    List<dynamic> illustrations = json['illustrations'] as List<dynamic>;
    List<String> illustrationsStrings =
        illustrations.map((e) => e as String).toList();

    return CompletionContent(
      history: json['history'] as String,
      illustrations: illustrationsStrings,
    );
  }
}
