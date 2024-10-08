
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/add_car_edit_car_widget.dart';
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({super.key,required this.screenSize,required this.data,required this.sellerHomeScreenBloc,this.isFromCarDetailsAppBar});
  final dynamic screenSize;
  final dynamic data;
  final dynamic sellerHomeScreenBloc;
  final bool? isFromCarDetailsAppBar;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      elevation: 5,
      onSelected: (value) {
        if (value == 'edit') {
           Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddCarEditCarWidget(screenSize: screenSize,sellerHomeScreenBloc: sellerHomeScreenBloc,isEditPage: true,data: data,isFromCarDetailsAppBar: isFromCarDetailsAppBar,)));
        } 
        else if (value == 'delete') {
          showDialog(
            barrierDismissible: false,
            context: context,
            barrierColor: Colors.black54, 
            builder: (context) => CustomAlertDialog(
              image: 'assets/images/bin.png',
              title: 'Remove Car',
              subtitle: 'Do you want to remove this car. This will remove the car for buyers also',
              screenSize: screenSize,
              sellerCarDelete: true,
              sellerCarData: data,
              sellerHomeScreenBloc: sellerHomeScreenBloc,
              isSellerCarDetailsAppbarDelete: isFromCarDetailsAppBar,             
            ),
          );                     
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