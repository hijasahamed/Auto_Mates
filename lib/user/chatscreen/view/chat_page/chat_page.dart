import 'package:auto_mates/seller/authentications/model/model.dart';
import 'package:auto_mates/seller/seller_chat_screen/controller/seller_chat_controller.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/bloc/user_chat_bloc.dart';
import 'package:auto_mates/user/chatscreen/view/chat_page/user_chat_delete_alert_dialog/user_chat_delete_alert_dialog.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key,
      required this.sellerData,
      required this.screenSize,
      required this.userData});
  final SellerData sellerData;
  final Size screenSize;
  final UserData userData;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  final ChatController chatControllerClass = ChatController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final UserChatBloc refreshtisRatedBloc = UserChatBloc();
  bool isRated = true;

  @override
  void initState() {
    super.initState();
    checkIfUserRatedSeller();
  }

  Future<void> checkIfUserRatedSeller() async {
    bool rated = await isUserRatedSeller(
      sellerId: widget.sellerData.id,
      userId: widget.userData.id,
    );
    isRated = rated;
    refreshtisRatedBloc.add(IsUserRatedTheSellerRefreshEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: NormalAppBar(
            title: widget.sellerData.companyName,
            isChatScreen: true,
          )),
      body: BlocBuilder<UserChatBloc, UserChatState>(
        bloc: refreshtisRatedBloc,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: buildMessagesection(),
              ),
              sendMessageSection(context)
            ],
          );
        },
      ),
    );
  }

  Widget buildMessagesection() {
    return StreamBuilder<List<QueryDocumentSnapshot>>(
      stream: getAllMessagesInChattingScreen(
          receiverId: widget.userData.id, userId: widget.sellerData.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        } else {
          List<DocumentSnapshot> sortedDocs = snapshot.data!;
          int sendedMessageCount = sortedDocs.length;

          if (sendedMessageCount == 3 && isRated == false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showRatingPopup(
                  context: context,
                  screenSize: widget.screenSize,
                  sellerData: widget.sellerData,
                  userData: widget.userData);
            });
          }
          sortedDocs.sort((a, b) {
            Timestamp aTimestamp = a['timeStamp'];
            Timestamp bTimestamp = b['timeStamp'];
            return aTimestamp.compareTo(bTimestamp);
          });
          WidgetsBinding.instance.addPostFrameCallback((_) => scrollToEnd());

          Map<String, List<DocumentSnapshot>> groupedMessages =
              groupMessagesByDate(sortedDocs);

          return ListView(
            controller: screenScrollController,
            children: groupedMessages.entries.map((entry) {
              String dateLabel = entry.key;
              List<DocumentSnapshot> messages = entry.value;
              return Scrollbar(
                controller: screenScrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: widget.screenSize.width,
                      color: const Color.fromARGB(255, 237, 237, 237),
                      child: Center(
                          child: MyTextWidget(
                              text: dateLabel,
                              color: Colors.blueGrey,
                              size: widget.screenSize.width / 35,
                              weight: FontWeight.bold)),
                    ),
                    ...messages.map((document) =>
                        showMessageItems(document: document, context: context)),
                  ],
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  Map<String, List<DocumentSnapshot>> groupMessagesByDate(
      List<DocumentSnapshot> sortedDocs) {
    final Map<String, List<DocumentSnapshot>> groupedMessages = {};
    final DateTime now = DateTime.now();

    for (var doc in sortedDocs) {
      final Timestamp timestamp = doc['timeStamp'];
      final DateTime messageDate = timestamp.toDate();

      String dateLabel;

      if (isSameDay(messageDate, now)) {
        dateLabel = 'Today';
      } else if (isSameDay(
          messageDate, now.subtract(const Duration(days: 1)))) {
        dateLabel = 'Yesterday';
      } else {
        dateLabel = DateFormat('dd MMM yyyy').format(messageDate);
      }

      if (!groupedMessages.containsKey(dateLabel)) {
        groupedMessages[dateLabel] = [];
      }

      groupedMessages[dateLabel]!.add(doc);
    }

    return groupedMessages;
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget showMessageItems({document, context}) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderUid'] == firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return UserChatDeleteAlertDialog(
                screenSize: widget.screenSize,
                onConfirm: () {
                  deleteUserChat(
                      sellerData: widget.sellerData,
                      userData: widget.userData,
                      data: data);
                  Navigator.of(context).pop();
                },
                onCancel: () => Navigator.of(context).pop(),
              );
            },
          );
        },
        child: Container(
          alignment: alignment,
          width: widget.screenSize.width / 1.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [               
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: data['senderUid'] == firebaseAuth.currentUser!.uid ? Colors.green : Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextWidget(
                            text: data['message'],
                            color: Colors.white,
                            size: widget.screenSize.width / 35,
                            weight: FontWeight.w500,
                            maxline: true,
                          ),
                          MyTextWidget(
                            text: formatTimestamp(timestamp: data['timeStamp'],chatsScreen: true),
                            color: Colors.white,
                            size: widget.screenSize.width / 65,
                            weight: FontWeight.bold),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sendMessageSection(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextFormWidget(
                screenSize: widget.screenSize,
                isChat: true,
                text: 'Overview',
                enabledBorderColor: Colors.transparent,
                valueTextColor: Colors.black,
                focusedBorderColor: Colors.transparent,
                labelTextColor: Colors.black,
                controller: messageController,
                warning: '',
                obscure: false,
                isChattingContainer: true,
                keyBoardType: TextInputType.name,
                textCapitalization: TextCapitalization.sentences,
                fillColor: const Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            width: widget.screenSize.width / 50,
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: IconButton(
                onPressed: () {
                  usersSendMessage(
                    chatControllerClass: chatControllerClass,
                    messageController: messageController,
                    sellerData: widget.sellerData,
                    userData: widget.userData,
                  );
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: widget.screenSize.width / 14,
                )),
          )
        ],
      ),
    );
  }
}
