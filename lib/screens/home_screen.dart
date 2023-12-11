import 'package:flutter/material.dart';
import 'package:storyteller/constants/app_theme.dart';
import 'package:storyteller/screens/story/story_screen.dart';
import 'package:storyteller/services/openai_service.dart';
import 'package:storyteller/widgets/app_bar.dart';
import 'package:storyteller/widgets/loading_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final aboutInputController = TextEditingController();
  final OpenAIService _openAIService = OpenAIService();
  bool _isLoading = false;

  @override
  void dispose() {
    aboutInputController.dispose();
    super.dispose();
  }

  void _validateInput() async {
    setState(() => _isLoading = true);
    String topic = aboutInputController.text;
    bool isSafeContent = await _openAIService.isSafeToProcess(topic);
    setState(() => _isLoading = false);
    if (isSafeContent) {
      _createStory(topic);
    } else {
      _badInput();
    }
  }

  void _createStory(String topic) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return StoryScreen(topic: topic);
    }));
  }

  void _badInput() {
    aboutInputController.text = '';
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Something strange happened'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Maybe not the best bedtime story...'),
                SizedBox(height: 20),
                Text("Let's try another topic"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'What do you want your story about tonight?',
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: TextField(
                  controller: aboutInputController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'A unicorn making a new friend',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _validateInput,
          tooltip: 'Make magic',
          child: const Icon(Icons.auto_stories),
        ),
      ),
    );
  }
}
