import 'package:flutter/material.dart';
import 'dart:math'; // Import for generating random answers

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.blue,
      ),
      home: Magic8BallPage(),
    );
  }
}

class Magic8BallPage extends StatefulWidget {
  @override
  _Magic8BallPageState createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {
  String question = "";
  String answer = "Ask a question!"; // Default answer

  // List of possible answers
  List<String> answers = [
    "Yes",
    "No",
    "Maybe",
    "Ask again later",
    "Definitely not",
    "Without a doubt",
    "It is certain",
    "Very likely",
    "Outlook good",
    "Don't count on it",
    "My sources say no",
    "Yes, absolutely"
  ];

  // Function to generate a random answer
  void getAnswer() {
    setState(() {
      answer = answers[Random().nextInt(answers.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Magic Ball',
          style: TextStyle(
            fontWeight: FontWeight.bold,

            // backgroundColor: Colors.blueGrey,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 115, 197),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ask a question:',
              style: TextStyle(
                fontSize: 24,
                // color: Colors.white,
              ),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  question = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Type Your Question Here...',
                labelStyle: TextStyle(
                  fontSize: 270.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifiso',
                  color: const Color.fromARGB(255, 241, 220, 220),
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: question.isEmpty
                  ? null
                  : getAnswer, // Only enable if a question is typed
              child: Text(
                'Click Here To Get Answer',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifiso',
                  color: const Color.fromARGB(255, 241, 220, 220),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              answer,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            if (question.isEmpty)
              Text(
                'Please Enter a Question First.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifiso',
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
