import 'package:whatsapp/models/dtos/user_dto.dart';
import 'package:whatsapp/models/enums/message_status_enum.dart';

class MessageDTO {
  int id;
  String message;
  UserDTO sender;
  DateTime sentAt;
  DateTime receivedAt;
  DateTime viewedAt;
  MessageStatusEnum status = MessageStatusEnum.NONE;
}
