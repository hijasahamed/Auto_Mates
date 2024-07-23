import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/bloc/user_chat_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateSellers extends StatelessWidget {
  const RateSellers({super.key,required this.screenSize,required this.sellerData});
  final Size screenSize;
  final dynamic sellerData;
  @override
  Widget build(BuildContext context) {    
    return Dialog(
        backgroundColor: Colors.white,
        child: SizedBox(
          height: screenSize.height / 3,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                rateText(),
                SizedBox(height: screenSize.height / 100,),
                rateSubText(),
                SizedBox(height: screenSize.height / 100,),
                ratingBar(),
                SizedBox(height: screenSize.height / 100,),
                emojis(),
              ],
            ),
          ),
        ),
      );
  }
  Widget rateText(){
    return MyTextWidget(
      text:
          'Satisfied with the responses of ${sellerData.companyName}',
      color: Colors.blueGrey,
      size: screenSize.width / 22,
      weight: FontWeight.bold,
      maxline: true,
      alignTextCenter: true,
    );
  }
  Widget rateSubText(){
    return MyTextWidget(
      text: 'Provide rating for the seller',
      color: Colors.blueGrey,
      size: screenSize.width / 30,
      weight: FontWeight.w400);
  }
  Widget ratingBar(){
    return RatingBar.builder(
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        emoji = getEmojiForRating(rating);
        userChatBloc.add(RatingEmojiRefreshEvent());
      },
    );
  }
  Widget emojis(){
    return BlocBuilder<UserChatBloc, UserChatState>(
      bloc: userChatBloc,
      builder: (context, state) {
        return MyTextWidget(
          text: emoji,
          color: Colors.blueGrey,
          size: screenSize.width / 10,
          weight: FontWeight.bold,
          alignTextCenter: true,
        );
      },
    );
  }
}