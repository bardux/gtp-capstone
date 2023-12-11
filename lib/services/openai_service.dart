import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:storyteller/models/moderation.dart';

class OpenAIService {
  OpenAIService();

  final String _baseUrl = 'https://api.openai.com/v1';

  Future<dynamic> _moderations(String topic) async {
    String endpoint = '/moderations';
    final url = Uri.parse('$_baseUrl/$endpoint');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${dotenv.env['OPENAI_KEY']}'
    };
    Map<String, String> body = {"input": topic};

    final response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      return Moderation.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get data: ${response.statusCode}');
    }
  }

  Future<bool> isSafeToProcess(String content) async {
    Moderation moderation = await _moderations(content);
    if (moderation.results.flagged) {
      return false;
    }

    bool categoriesContainsFlags =
        moderation.results.categories.values.any((element) => element);
    if (categoriesContainsFlags) {
      return false;
    }

    double moderationThreshold = 0.005;
    bool categoriesContainsBadScore = moderation.results.categoryScores.values
        .any((element) => element > moderationThreshold);
    if (categoriesContainsBadScore) {
      return false;
    }
    return true;
  }
}
