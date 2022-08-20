import 'package:flutter_get_cli_demo/app/data/models/message_model.dart';
import 'package:flutter_get_cli_demo/app/data/provider/message_provider.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final messages = RxList<MessageModel>([]);
  final activeNotificationTab = Rx<String>("General");

  @override
  void onInit() {
    MessageProvider.fetchMessages().then((apiMessages) {
      messages.value = apiMessages;
      update();
    });
    super.onInit();
  }

  String get activeNotificationTabValue =>
      activeNotificationTab.value == "General" ? "Notifications" : "Messages";

  List<MessageModel> get newMessages {
    return messages.where((message) => !message.hasRead).toList();
  }

  List<MessageModel> get oldMessages {
    return messages.where((message) => message.hasRead).toList();
  }

  void changeActiveNotificationTab(String value) {
    activeNotificationTab.value = value;
    update();
  }

  bool isActiveNotificationTab(String value) {
    return activeNotificationTab.value == value;
  }
}
