import 'package:flutter/material.dart';
import 'package:new_chat_me/core/theme.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message Page",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            "Recent",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContract(context, "Luffy"),
                _buildRecentContract(context, "Zoro"),
                _buildRecentContract(context, "Sanji"),
                _buildRecentContract(context, "Jimbe"),
                _buildRecentContract(context, "Brook"),
                _buildRecentContract(context, "Franky"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),  
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: DefaultColors.messageListPage,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: ListView(
                children: [
                  _buildMessageTile("Ussop", "Ussop@gmail.com", "08:45"),
                  _buildMessageTile("Nami", "Ussop@gmail.com", "08:45"),
                  _buildMessageTile("Choper", "Ussop@gmail.com", "08:45"),
                  _buildMessageTile("Robin", "Ussop@gmail.com", "08:45"),
                  _buildMessageTile("Bibi", "Ussop@gmail.com", "08:45"),
                  _buildMessageTile("Ace", "Ussop@gmail.com", "08:45"),
                  _buildMessageTile("Roger", "Ussop@gmail.com", "08:45"),
                  _buildMessageTile("Whitebeard", "Ussop@gmail.com", "08:45"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecentContract(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://placehold.jp/150x150.png'),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage('https://placehold.jp/150x150.png'),
      ),
      title: Text(
        name,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
