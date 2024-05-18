import 'package:auto_mates/user/commonwidgets/common_widgets.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:flutter/material.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key,required this.profileScreenBloc,required this.screenSize});
  final ProfileScreenBloc profileScreenBloc;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(screenSize.width, screenSize.height/20)),
        backgroundColor: const WidgetStatePropertyAll(Colors.white)
       ),
        onPressed: () async {
          profileScreenBloc.add(LogoutButtonClickedEvent());
        },
        child: const MyTextWidget(text: 'Logout', color: Colors.red, size: 15, weight: FontWeight.w500));
  }
}
