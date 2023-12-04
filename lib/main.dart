import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'OpenAI-API flutter demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
List<String> messages = <String>[];
bool isBotThinking = false;
List<bool> isBotThinkingList = <bool>[];
// Add the value of isBotThinking to the list

Widget _buildListTile(String message, bool isBotThinking, int position) {
  return ListTile(
    title: Text(message),
    tileColor: isBotThinkingList[position] ? Colors.green : Colors.blue,
  );
}


void _incrementCounter() {
  setState(() {

    isBotThinkingList.add(false); // TODO figure out how to get rid of this godforsaken thing
    if (isBotThinking == false) {
      messages.add("This is where user input will go");
      messages.add("bool is " + isBotThinking.toString());
      isBotThinkingList.add(false); // Add the value of isBotThinking to the list
      isBotThinking = true;
    }
    else {
      messages.add("Hello, I am a chatbot. How can I help you?");
      messages.add("bool is " + isBotThinking.toString());
      isBotThinkingList.add(true); // Add the value of isBotThinking to the list
      isBotThinking = false;
    }
  });
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        child: Column( // Use a Column widget to hold multiple children
          children: [
            Expanded( // Use an Expanded widget to fill the remaining space
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int position) {
                  return _buildListTile(messages[position], isBotThinking, position);
                },
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your message',
                labelText: 'What would you like help with today?',
                floatingLabelAlignment: FloatingLabelAlignment.center,
              )
            ),
            ElevatedButton( // Place the ElevatedButton widget as the last child of the Column widget
              onPressed: _incrementCounter,
              child: Text('Send Message'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
              ),
            ),
            )],
        ),
      ),
    );



  }
}
