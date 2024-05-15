import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car/add_car_edit_car_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({super.key,required this.screenSize,required this.data,required this.sellerHomeScreenBloc});
  final Size screenSize;
  final DocumentSnapshot data;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      elevation: 5,
      onSelected: (value) {
        if (value == 'edit') {
           Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddCarEditCarWidget(screenSize: screenSize,sellerHomeScreenBloc: sellerHomeScreenBloc,isEditPage: true,data: data,)));
        } 
        else if (value == 'delete') {
          deleteAlertDialogwidget(sellerHomeScreenBloc,context: context,docId:data.id,title: 'Delete',content: 'Do you want to remove this car details');                     
        }
      },
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      itemBuilder: (context) {
        return[
          PopupMenuItem(
            value: 'edit',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                const Icon(Icons.edit,color: Colors.green,),
                SizedBox(width: screenSize.width/40,),
                const Text('Edit',style: TextStyle(color: Color(0xFF424141))),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                const Icon(Icons.delete,color: Colors.red,),
                SizedBox(width: screenSize.width/40,),
                const Text('Delete',style: TextStyle(color: Color(0xFF424141)),),
              ],
            ),
          ),
        ];
      },
    );
  }
}