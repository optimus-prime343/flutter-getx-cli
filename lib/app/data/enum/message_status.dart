enum MessageStatus {
  unread,
  read,
}

extension MessageStatusExtension on MessageStatus {
  String get name {
    switch (this) {
      case MessageStatus.unread:
        return 'New';
      case MessageStatus.read:
        return 'Earlier';
      default:
        return '';
    }
  }
}
