import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';

/// A chat view widget that allows users to interact with a chatbot.
class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ChatUser human = ChatUser(id: '1', firstName: 'Rohith', lastName: 'Kumar');
  ChatUser bot = ChatUser(id: '2', firstName: 'Odin');
  final url = Constant().baseUrl + Constant().apiKey;
  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];

  final header = {'Content-Type': 'application/json'};

  /// Retrieves chatbot responses based on user messages.
  ///
  /// Inserts the user message into the list of all messages and adds the bot user to the list of typing users.
  /// Sends a POST request to the chatbot API with the user message as input.
  /// Inserts the bot's response into the list of all messages.
  /// Removes the bot user from the list of typing users.
  getMessages(ChatMessage m) async {
    allMessages.insert(0, m);
    typing.add(bot);
    setState(() {});
    var promptText = """
          autocomplete this chat, reply like an old wise norse god :
          ${(allMessages.length > 1) ? "you: ${allMessages[1].text}" : ""}
          user: ${m.text}
          you: (reply with whatever you want to complete here. dont reply all chats)
    """;
    var data = {
      "contents": [
        {
          "parts": [
            {"text": promptText}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(url), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var response = jsonDecode(value.body);
        ChatMessage m2 = ChatMessage(
          user: bot,
          text: response['candidates'][0]['content']['parts'][0]['text'],
          createdAt: DateTime.now(),
        );
        allMessages.insert(0, m2);
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
        scrollToBottomOptions: const ScrollToBottomOptions(disabled: false),
        typingUsers: typing,
        currentUser: human,
        onSend: (ChatMessage message) {
          getMessages(message);
        },
        messages: allMessages,
      ),
    );
  }
}
