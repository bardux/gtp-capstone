import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storyteller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Storyteller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'What do you want your story about tonight?',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: aboutInputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Unicorn making a new friend',
                ),
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
