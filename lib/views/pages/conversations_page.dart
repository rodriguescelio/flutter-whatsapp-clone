import 'package:flutter/material.dart';
import 'package:whatsapp/models/enums/message_status_enum.dart';
import 'package:whatsapp/models/enums/message_type_enum.dart';
import 'package:whatsapp/views/components/conversation.dart';

class ConversationsPage extends StatelessWidget {
  static List<String> _avatars = [
    'https://github.com/rodriguescelio/flutter-whatsapp-clone/raw/master/lib/assets/1.jpg',
    'https://github.com/rodriguescelio/flutter-whatsapp-clone/raw/master/lib/assets/3.jpg',
    'https://github.com/rodriguescelio/flutter-whatsapp-clone/raw/master/lib/assets/4.jpg',
    'https://github.com/rodriguescelio/flutter-whatsapp-clone/raw/master/lib/assets/5.jpg'
  ];

  final List<Conversation> _conversations = [
    Conversation(
      avatar: _avatars[0],
      name: 'Usuário 1',
      message: 'Esta mensagem foi enviada ao usuário 1',
      date: '21:51',
      status: MessageStatusEnum.VIEWED,
      type: MessageTypeEnum.TEXT,
    ),
    Conversation(
      avatar: _avatars[1],
      name: 'Usuário 2',
      message: 'Esta mensagem foi enviada pelo usuário 2',
      date: '21:51',
      status: MessageStatusEnum.NONE,
      type: MessageTypeEnum.TEXT,
    ),
    Conversation(
      avatar: _avatars[2],
      name: 'Usuário 3',
      message: 'Esta mensagem foi enviada ao usuário 3',
      date: '21:51',
      status: MessageStatusEnum.SENT,
      type: MessageTypeEnum.TEXT,
    ),
    Conversation(
      avatar: _avatars[3],
      name: 'Usuário 4',
      message: 'Video',
      date: '21:51',
      status: MessageStatusEnum.NONE,
      type: MessageTypeEnum.VIDEO,
    ),
    Conversation(
      name: 'Usuário 5',
      message: 'Olha esse vídeo',
      date: '21:51',
      status: MessageStatusEnum.RECEIVED,
      type: MessageTypeEnum.VIDEO,
    ),
  ];

  _onTap(Conversation conversation) {
    print('Tap');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext buildContext, int index) {
        var item = _conversations[index];
        return GestureDetector(
          child: item,
          onTap: () => _onTap(item),
        );
      },
      itemCount: _conversations.length,
    );
  }
}
