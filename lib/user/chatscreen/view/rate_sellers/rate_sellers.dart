import 'package:auto_mates/user/chatscreen/controller/chat_controller/chat_controller.dart';
import 'package:auto_mates/user/chatscreen/view/bloc/user_chat_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateSellers extends StatelessWidget {
  const RateSellers(
      {super.key, required this.screenSize, required this.sellerData});
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
              SizedBox(
                height: screenSize.height / 100,
              ),
              rateSubText(),
              SizedBox(
                height: screenSize.height / 100,
              ),
              ratingBar(),
              SizedBox(
                height: screenSize.height / 100,
              ),
              emojis(),
              SizedBox(
                height: screenSize.height / 100,
              ),
              ratingButtons(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget rateText() {
    return MyTextWidget(
      text: 'Satisfied with the responses of ${sellerData.companyName}',
      color: Colors.blueGrey,
      size: screenSize.width / 22,
      weight: FontWeight.bold,
      maxline: true,
      alignTextCenter: true,
    );
  }

  Widget rateSubText() {
    return MyTextWidget(
        text: 'Provide rating for the seller',
        color: Colors.blueGrey,
        size: screenSize.width / 30,
        weight: FontWeight.w400);
  }

  Widget ratingBar() {
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
        ratingValue = rating;
        emoji = getEmojiForRating(rating);
        userChatBloc.add(RatingEmojiRefreshEvent());
      },
    );
  }

  Widget emojis() {
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

  Widget ratingButtons(context) {
    UserChatBloc userRates = UserChatBloc();
    return Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Ink(
            height: screenSize.height / 17,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: .4, color: Colors.blueGrey)),
            child: Center(
                child: MyTextWidget(
                    text: 'Skip Now',
                    color: Colors.blueGrey,
                    size: screenSize.width / 33,
                    weight: FontWeight.bold)),
          ),
        )),
        SizedBox(
          width: screenSize.width / 50,
        ),
        Expanded(
            child: InkWell(
          onTap: () {
            addRating(
                rating: ratingValue, sellerData: sellerData, context: context,userRates: userRates);
          },
          child: Ink(
            height: screenSize.height / 17,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: .4, color: Colors.blueGrey)),
            child: Center(
                child: BlocConsumer<UserChatBloc, UserChatState>(
                  bloc: userRates,
              listener: (context, state) {},
              builder: (context, state) {
                if(state is UserRatedTheSellerState){
                  return Icon(Icons.check,color: Colors.green,size: screenSize.width / 13,);
                }
                else if(state is UserRatedTheSellerLoadingState){
                  return const CircularProgressIndicator(color: Colors.blue,);
                }
                else{
                  return MyTextWidget(
                    text: 'Add Rating',
                    color: Colors.blueGrey,
                    size: screenSize.width / 33,
                    weight: FontWeight.bold);
                }                
              },
            )),
          ),
        )),
      ],
    );
  }
}
