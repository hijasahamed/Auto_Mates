import 'package:auto_mates/seller/seller_profile_screen/view/bloc/seller_profile_bloc.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerLogoutWidget extends StatelessWidget {
  const SellerLogoutWidget(
      {super.key, required this.screenSize, required this.sellerProfileBloc});
  final Size screenSize;
  final SellerProfileBloc sellerProfileBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProfileBloc, SellerProfileState>(
      bloc: sellerProfileBloc,
      builder: (context, state) {
        return Ink(
          height: screenSize.height / 20,
          width: screenSize.width / 2.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width/100),
            color: const Color.fromARGB(255, 247, 247, 247),
            border: Border.all(width: .3,color: Colors.grey)
          ),
          child: InkWell(
            onTap: () {
              sellerProfileBloc.add(SellerLogoutButtonClickedEvent());
            },
            child: const Center(
              child: MyTextWidget(
                  text: 'Logout',
                  color: Colors.red,
                  size: 18,
                  weight: FontWeight.w400),
            ),
          ),
        );
      },
    );
  }
}
