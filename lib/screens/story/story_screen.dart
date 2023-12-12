import 'package:flutter/material.dart';
import 'package:storyteller/constants/app_theme.dart';
import 'package:storyteller/models/completion.dart';
import 'package:storyteller/screens/story/components/illustrator.dart';
import 'package:storyteller/services/openai_service.dart';
import 'package:storyteller/widgets/app_bar.dart';
import 'package:storyteller/widgets/loading_overlay.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, required this.topic});

  final String topic;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final OpenAIService _openAIService = OpenAIService();
  bool _isLoading = false;
  String _history = "";
  String _illustrationDescription = "";

  @override
  void initState() {
    super.initState();
    _createStory();
  }

  void _createStory() async {
    setState(() => _isLoading = true);
    Completion completion = await _openAIService.completions(widget.topic);
    if (completion.choices.finishReason == "stop") {
      setState(() => _history = completion.choices.message.content.history);
      setState(() => _illustrationDescription =
          completion.choices.message.content.illustration);
    }
  }

  void stopLoading() {
    Future.delayed(Duration.zero, () async {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Stack(
          children: [
            Illustrator(
              illustrationDescription: _illustrationDescription,
              callback: stopLoading,
            ),
            const Opacity(
              opacity: 0.6,
              child: ModalBarrier(
                dismissible: false,
                color: Colors.black,
              ),
            ),
            if (!_isLoading)
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding * 2),
                    child: Text(
                      _history,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFFB8C0D9),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
