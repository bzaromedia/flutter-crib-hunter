import 'package:crib_hunter/Models/messagingObjects.dart';
import 'package:crib_hunter/Screens/conversationPage.dart';
import 'package:crib_hunter/Views/listWidgets.dart';
import 'package:flutter/material.dart';
import 'package:crib_hunter/Models/appConstants.dart';

class InboxPage extends StatefulWidget {
  InboxPage({Key key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListView.builder(
        itemCount: AppConstants.currentUser.conversations.length,
        itemExtent: MediaQuery.of(context).size.height / 7,
        itemBuilder: (context, index) {
          Conversation currentConversation =
              AppConstants.currentUser.conversations[index];
          return InkResponse(
            child: ConversationListTile(
              conversation: currentConversation,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversationPage(
                    conversation: currentConversation,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
