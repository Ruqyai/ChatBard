// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'oauth.dart';

class ArabicBardScreen extends StatefulWidget {
  const ArabicBardScreen({super.key});

  @override
  _ArabicBardScreenState createState() => _ArabicBardScreenState();
}

class _ArabicBardScreenState extends State<ArabicBardScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];
  final List<String> chatHistory = [];

//-------------Start the Arabic Chat ----------
  Future<void> sendMsgRESTAPI(String message) async {
    final String apiUrlChatAr = urlChatRESTApiAr;
    final headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };

    final body = '''
    {"message": "$message"}
    ''';

    final response =
        await http.post(Uri.parse(apiUrlChatAr), headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final parsedJson = json.decode(responseBody);
      final reply = parsedJson['response'];
      print(reply);
      setState(() {
        _messages.add(reply);
        chatHistory.add(reply);
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  //------------- handle Submitted message----------
  void _handleSubmitted(String text) async {
    _textEditingController.clear();
    setState(() {
      _messages.add(text);
      chatHistory.add(text);
    });

    try {
      await sendMsgRESTAPI(text);
    } catch (e) {
      print(e.toString());
    }
  }

//-------------summarize And Save the Arabic Chat Session RESTAPI ----------
  Future<void> summarizeAndSaveChatSessionRESTAPI() async {
    var summary = '';
    final String apiSummarizeChatAr = urlSummarizeChatRESTApiAr;
    final headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };

    final body = '''
    {"content": "[$chatHistory]"}
    ''';

    final response = await http.post(Uri.parse(apiSummarizeChatAr),
        headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final parsedJson = json.decode(responseBody);
      final reply = parsedJson['response'];
      summary = reply;
      print(summary);

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
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'العربي Bard',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
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
                    hintText: 'اكتب رسالتك...',
                  ),
                  onSubmitted: _handleSubmitted,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Directionality(
          textDirection: TextDirection.ltr,
          child: Tooltip(
            message: 'تلخيص وحفظ',
            child: FloatingActionButton(
              onPressed: () {
                summarizeAndSaveChatSessionRESTAPI().catchError((error) {
                  print('خطأ في تلخيص جلسة الدردشة: $error');
                });
              },
              child: const Icon(Icons.save),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
