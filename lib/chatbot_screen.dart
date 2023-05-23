// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'examples.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'oauth.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];
  final List<String> chatHistory = [];
  
//-------------Start the Chat ----------
  Future<void> sendMessage(String message) async {
    final String apiUrlChat = urlChatApi;
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final body = '''
    {
      "instances": [
        {
          "context": "$context",
          "examples": [$examples],
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
        await http.post(Uri.parse(apiUrlChat), headers: headers, body: body);

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
        chatHistory.add(reply);
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  void _handleSubmitted(String text) async {
    _textEditingController.clear();

    setState(() {
      _messages.add(text);
      chatHistory.add(text);
    });

    try {
      await sendMessage(text);
    } catch (e) {
      print(e.toString());
    }
  }

  //----------------Summarize Then Save The Chat ----------

  Future<void> summarizeAndSaveChatSession() async {
    var summary = '';
    final String apiUrlSummarizeChat = urlSummarizeChatApi;
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    final body = '''
    {
     "instances": [
          {
          "content": "Summarize the following conversation between a service rep and a customer in a few sentences. Use only the information from the conversation. $chatHistory"
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

    final response = await http.post(
      Uri.parse(apiUrlSummarizeChat),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final parsedJson = json.decode(responseBody);
      final predictions = parsedJson['predictions'];
      if (predictions != null && predictions.isNotEmpty) {
        final content = predictions[0]['content'];
        if (content != null) {
          print(content);
          summary = content;
        }
      }
      //Save the summarized chat in Firebase
      final CollectionReference chatSummariesCollection =
          FirebaseFirestore.instance.collection('chat_summaries');
      await chatSummariesCollection.add({
        'userId': Random().nextInt(999999),
        'date': DateTime.now(),
        'summary': summary,
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

//----------------Build UI ----------
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ChatBARD',
          ),
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
        floatingActionButton: Tooltip(
          message: 'Summarize and Save',
          child: FloatingActionButton(
            onPressed: () {
              summarizeAndSaveChatSession().catchError((error) {
                print('Error summarizing chat session: $error');
              });
            },
            child: const Icon(Icons.save),
          ),
        ),
      ),
    );
  }
}
