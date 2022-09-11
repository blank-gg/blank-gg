import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../widgets/message.dart';


class ViewMessages extends StatefulWidget {
  const ViewMessages({Key? key}) : super(key: key);

  @override
  State<ViewMessages> createState() => _ViewMessagesState();
}

class _ViewMessagesState extends State<ViewMessages> {
  List<Message> messages = [
    Message(
        text: 'Yep',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
  ].reversed.toList();
  final _controller = TextEditingController();

  Color setBoxColor(Message message) {
    if (message.isSentByMe == true) {
      return Color(0xff00501E);
    } else {
      return Color(0xffDEE5E1FF);
    }
  }

  Color setTextColor(Message message) {
    if (message.isSentByMe == true) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct Messages"),
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  floatingHeader: true,
                  useStickyGroupSeparators: true,
                  padding: const EdgeInsets.all(8),
                  elements: messages,
                  groupBy: (message) => DateTime(
                      message.date.year, message.date.month, message.date.day),
                  groupHeaderBuilder: (Message message) => SizedBox(
                      height: 40,
                      child: Center(
                        child: Card(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              DateFormat.yMMMd().format(message.date),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  itemBuilder: (context, Message message) => Align(
                        alignment: message.isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          color: setBoxColor(message),
                          elevation: 8,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              message.text,
                              style: TextStyle(color: setTextColor(message)),
                            ),
                          ),
                        ),
                      ))),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
              controller: _controller,
              onSubmitted: (text) {
                final message = Message(
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );
                setState(() {
                  messages.add(message);
                  _controller.clear();
                });
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Type a message...',
              ),
            ),
          )
        ],
      ),
    );
  }
}
