class CompletionUsage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  CompletionUsage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory CompletionUsage.fromJSON(Map<String, dynamic> json) {
    return CompletionUsage(
      promptTokens: json['prompt_tokens'] as int,
      completionTokens: json['completion_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );
  }
}
