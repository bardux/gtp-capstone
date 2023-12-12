class ImageGeneration {
  final int created;
  final String revisedPrompt;
  final String url;

  ImageGeneration({
    required this.created,
    required this.revisedPrompt,
    required this.url,
  });

  factory ImageGeneration.fromJSON(Map<String, dynamic> json) {
    List<dynamic> data = json['data'] as List<dynamic>;

    return ImageGeneration(
      created: json['created'] as int,
      revisedPrompt:
          (data[0] as Map<String, dynamic>)['revised_prompt'] as String,
      url: (data[0] as Map<String, dynamic>)['url'] as String,
    );
  }
}
