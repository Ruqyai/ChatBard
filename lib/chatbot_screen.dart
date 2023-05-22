// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];

  final String apiUrl ="https://us-central1-aiplatform.googleapis.com/v1/projects/ai-projects2023/locations/us-central1/publishers/google/models/chat-bison@001:predict";
  // To get the accessToken run on the Terminal then copy it:   gcloud auth print-access-token
  final String accessToken ='';
  
  Future<void> sendMessage(String message) async {
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final body = '''
    {
      "instances": [
        {
          "context": "",
          "examples": [],
          "messages": [
            {
              "role": "system",
              "content": "$message"
            }
          ]
        }
      ],
      "parameters": {
        "temperature": 0.2,
        "maxOutputTokens": 256,
        "topP": 0.8,
        "topK": 40
      }
    }
    ''';

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final parsedJson = json.decode(responseBody);
      var reply = '';
      final predictions = parsedJson['predictions'];
      if (predictions != null && predictions.isNotEmpty) {
        final candidates = predictions[0]['candidates'];
        if (candidates != null && candidates.isNotEmpty) {
          final content = candidates[0]['content'];
          if (content != null) {
            reply = content;
          }
        }
      }
      setState(() {
        _messages.add(reply);
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  void _handleSubmitted(String text) async {
    _textEditingController.clear();

    setState(() {
      _messages.add(text);
    });

    try {
      await sendMessage(text);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
              onSubmitted: _handleSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
