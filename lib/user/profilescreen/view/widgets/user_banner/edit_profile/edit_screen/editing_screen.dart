import 'dart:io';
import 'package:auto_mates/user/authentications/controller/functions/fuctions.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:auto_mates/user/commonwidgets/text_form_field/text_form_widget.dart';
import 'package:auto_mates/user/profilescreen/controller/functions.dart';
import 'package:auto_mates/user/profilescreen/view/bloc/profile_screen_bloc.dart';
import 'package:auto_mates/user/profilescreen/view/widgets/user_banner/edit_profile/edit_screen/edit_user_image/edit_user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditingScreen extends StatefulWidget {
  const EditingScreen({
    super.key,
    required this.screenSize,
    required this.user,
  });
  final Size screenSize;
  final UserData user;

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  TextEditingController userNameEditController = TextEditingController();
  TextEditingController userMobileEditController = TextEditingController();
  TextEditingController userLocationEditController = TextEditingController();
  final GlobalKey<FormState> editUserFormkey = GlobalKey<FormState>();
  ProfileScreenBloc editUserImageBloc = ProfileScreenBloc();
  ProfileScreenBloc updateLoadingBloc = ProfileScreenBloc();
  @override
  void initState() {
    userNameEditController.text = widget.user.userName;
    userMobileEditController.text = widget.user.mobile;
    userLocationEditController.text = widget.user.location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
      bloc: editUserImageBloc,
      builder: (context, state) {
        ImageProvider? imageProvider;
        if (userProfileImage == null || userProfileImage!.isEmpty) {
          imageProvider = NetworkImage(widget.user.userProfile);
        } else {
          Uri uri = Uri.parse(userProfileImage!);
          if (uri.isAbsolute) {
            imageProvider = NetworkImage(userProfileImage!);
          } else {
            imageProvider = FileImage(File(userProfileImage!));
          }
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: MyTextWidget(
                text: 'Edit Profile',
                color: Colors.blueGrey,
                size: widget.screenSize.width / 27,
                weight: FontWeight.bold),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: widget.screenSize.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EditUserImage(
                        screenSize: widget.screenSize,
                        imageProvider: imageProvider,
                        editUserImageBloc: editUserImageBloc),
                    SizedBox(
                      height: widget.screenSize.height / 25,
                    ),
                    Form(
                        key: editUserFormkey,
                        child: Column(
                          children: [
                            MyTextFormWidget(
                                screenSize: widget.screenSize,
                                text: 'Name',
                                enabledBorderColor: Colors.white,
                                focusedBorderColor: Colors.red,
                                valueTextColor: Colors.black,
                                labelTextColor: Colors.grey,
                                controller: userNameEditController,
                                warning: 'Enter the username',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                            SizedBox(
                              height: widget.screenSize.height / 25,
                            ),
                            MyTextFormWidget(
                                screenSize: widget.screenSize,
                                text: 'Mobile',
                                enabledBorderColor: Colors.white,
                                focusedBorderColor: Colors.red,
                                valueTextColor: Colors.black,
                                labelTextColor: Colors.grey,
                                controller: userMobileEditController,
                                warning: 'Enter the Mobile Number',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                            SizedBox(
                              height: widget.screenSize.height / 25,
                            ),
                            MyTextFormWidget(
                                screenSize: widget.screenSize,
                                text: 'Location',
                                enabledBorderColor: Colors.white,
                                focusedBorderColor: Colors.red,
                                valueTextColor: Colors.black,
                                labelTextColor: Colors.grey,
                                controller: userLocationEditController,
                                warning: 'Enter your Location',
                                obscure: false,
                                keyBoardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                fillColor: const Color(0XFFDBEDF5)),
                          ],
                        )),
                        SizedBox(height: widget.screenSize.height/50,),
                    MyTextWidget(text: 'The Changes you make will be updated across all the users', color: Colors.grey, size: widget.screenSize.width/30, weight: FontWeight.w600,maxline: true,)    
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              updateUserDetails(
                name: userNameEditController,
                mobile: userMobileEditController,
                location: userLocationEditController,
                context: context,
                formkey: editUserFormkey,
                user: widget.user,
                updateLoadingBloc: updateLoadingBloc
              );
            },
            child: BottomAppBar(
              height: widget.screenSize.height/12.5,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
                    bloc: updateLoadingBloc,
                    builder: (context, state) {
                      if(state is UpdateUserLoadingState){
                        return const CircularProgressIndicator(color: Colors.white,);
                      }else{
                        return MyTextWidget(
                          text: 'Update User Details',
                          color: Colors.white,
                          size: widget.screenSize.width/30,
                          weight: FontWeight.bold);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
