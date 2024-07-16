import 'package:cloud_firestore/cloud_firestore.dart';

class Message{

  final String senderId;
  final String senderEmail;
  final String userId;
  final String receiverId;
  final String message;
  final Timestamp timeStamp;
  final String senderName;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.userId,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
    required this.senderName
  });

  Map<String,dynamic> toMap(){
    return{
      'senderId' : senderId,
      'senderEmail' : senderEmail,
      'userId' : userId,
      'receiverId' : receiverId,
      'message' : message,
      'timeStamp' : timeStamp,
      'senderName': senderName
    };
  }

}