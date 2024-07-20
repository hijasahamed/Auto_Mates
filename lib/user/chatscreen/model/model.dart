import 'package:cloud_firestore/cloud_firestore.dart';

class Message{

  final String senderUid;
  final String senderEmail;
  final String senderId;
  final String receiverId;
  final String message;
  final Timestamp timeStamp;
  final String senderName;

  Message({
    required this.senderUid,
    required this.senderEmail,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
    required this.senderName
  });

  Map<String,dynamic> toMap(){
    return{
      'senderUid' : senderUid,
      'senderEmail' : senderEmail,
      'senderId' : senderId,
      'receiverId' : receiverId,
      'message' : message,
      'timeStamp' : timeStamp,
      'senderName': senderName
    };
  }

}