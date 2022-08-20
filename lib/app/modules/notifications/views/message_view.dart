import 'package:flutter/material.dart';
import 'package:flutter_get_cli_demo/app/core/values/colors.dart';
import 'package:flutter_get_cli_demo/app/data/enum/message_status.dart';
import 'package:flutter_get_cli_demo/app/data/models/message_model.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/controllers/notifications_controller.dart';

import 'package:get/get.dart';

class MessageView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              0,
              16.0,
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessageList(
                  messages: controller.newMessages,
                  messageStatus: MessageStatus.unread,
                ),
                MessageList(
                  messages: controller.oldMessages,
                  messageStatus: MessageStatus.read,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class MessageList extends StatelessWidget {
  final List<MessageModel> messages;
  final MessageStatus messageStatus;
  const MessageList({
    Key? key,
    required this.messages,
    required this.messageStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> messageList() {
      return messages.map((message) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(
                message.user.profileImage,
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    message.user.username,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimary,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      message.message,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.6,
                        color: kTextPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    message.date,
                    style: TextStyle(
                      color: kTextPrimary,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            if (!message.hasRead)
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
          ],
        );
      }).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          messageStatus.name,
          style: TextStyle(
            fontSize: 16.0,
            color: kPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        ...messageList(),
      ],
    );
  }
}
