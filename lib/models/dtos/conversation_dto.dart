import 'package:whatsapp/models/dtos/message_dto.dart';
import 'package:whatsapp/models/dtos/user_dto.dart';

class ConversationDTO {
  int id;
  List<UserDTO> users = [];
  List<MessageDTO> messages = [];
}
