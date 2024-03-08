import 'dart:convert';
import 'package:farmerapp/localization/app_localizations.dart';

import 'aichat/constant.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.user2Name,
    required this.promptText,
  }) : super(key: key);
  final String promptText;
  final String firstName;
  final String lastName;
  final String user2Name;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatUser human;
  late ChatUser bot;
  final url = Constant().baseUrl + Constant().apiKey;
  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];

  final header = {'Content-Type': 'application/json'};

  getMessages(ChatMessage m) async {
    allMessages.insert(0, m);
    typing.add(bot);
    setState(() {});
    var promptText = """
          autocomplete this chat, ${widget.promptText} :
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
  void initState() {
    super.initState();
    human = ChatUser(
        id: '1', firstName: widget.firstName, lastName: widget.lastName);
    bot = ChatUser(id: '2', firstName: widget.user2Name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("chatbot_heading")
                  .toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("chat_disclaimer1")
                  .toString(),
              style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.red[400]),
            ),
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("chat_disclaimer2")
                  .toString(),
              style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.red[400]),
            ),
          ],
        ),
        centerTitle: true,
      ),
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

class AiChatPage extends StatelessWidget {
  const AiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatPage(
        firstName: "Team",
        lastName: "35UM",
        user2Name: "Dairy Expert",
        promptText:
            "Reply like an expert in the field of dairy farming and reply in the name of 'Reply From Team 35UM (Dairy Expert)'. Also try not to keep the chat too short or too long.");
  }
}
