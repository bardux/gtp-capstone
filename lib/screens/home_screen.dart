import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storyteller/constants/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final aboutInputController = TextEditingController();

  @override
  void dispose() {
    aboutInputController.dispose();
    super.dispose();
  }

  void _validateInput() {
    print(aboutInputController.text);
    print(dotenv.env['OPENAI_KEY']);
  }

  void _badInput() {}

  void _generateStory() {}

  void _generateImages() {}

  void _readStory() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Storyteller',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
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
    );
  }
}
