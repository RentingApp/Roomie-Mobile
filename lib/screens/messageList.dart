import 'package:flutter/material.dart';
import '../widgets/message/eachMessageListItem.dart';
import '../globals/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CustomAppbar()]),
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem(),
          EachMessageListItem()
        ],
      )),
    );
  }
}
