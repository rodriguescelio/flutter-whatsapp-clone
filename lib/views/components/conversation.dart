import 'package:flutter/material.dart';
import 'package:whatsapp/models/enums/message_status_enum.dart';
import 'package:whatsapp/models/enums/message_type_enum.dart';

class Conversation extends StatelessWidget {
  final String avatar;
  final String name;
  final String message;
  final String date;
  final MessageTypeEnum type;
  final MessageStatusEnum status;

  Conversation({
    this.avatar = '',
    this.name = '',
    this.message = '',
    this.date = '',
    this.type = MessageTypeEnum.TEXT,
    this.status = MessageStatusEnum.NONE,
  });

  _getMessageStatus() {
    switch (status) {
      case MessageStatusEnum.SENT:
        return Icon(
          Icons.check,
          size: 16.0,
          color: Colors.grey,
        );
      case MessageStatusEnum.RECEIVED:
      case MessageStatusEnum.VIEWED:
        return Icon(
          Icons.done_all,
          size: 16.0,
          color: status == MessageStatusEnum.VIEWED
              ? Colors.blueAccent
              : Colors.grey,
        );
      default:
        return Container();
    }
  }

  _getMessageType() {
    var icon;
    switch (type) {
      case MessageTypeEnum.AUDIO:
        icon = Icons.mic;
        break;
      case MessageTypeEnum.IMAGE:
        icon = Icons.image;
        break;
      case MessageTypeEnum.VIDEO:
        icon = Icons.videocam;
        break;
      default:
    }

    return icon != null
        ? Padding(
            padding: EdgeInsets.only(right: 3.0),
            child: Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: avatar != ''
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(avatar),
                    ),
                  )
                : BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15.0,
              top: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getMessageStatus(),
                      _getMessageType(),
                      Text(message)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
