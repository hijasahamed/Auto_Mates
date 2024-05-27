import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/textformfield/add_edit_form_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/app_bar_gradient_color.dart';
import 'package:auto_mates/user/commonwidgets/common_widgets/common_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCarEditCarWidget extends StatefulWidget {
  const AddCarEditCarWidget(
      {super.key,
      required this.screenSize,
      required this.sellerHomeScreenBloc,
      required this.isEditPage,
      this.data});
  final Size screenSize;
  final SellerHomeScreenBloc sellerHomeScreenBloc;
  final bool isEditPage;
  final DocumentSnapshot? data;
  @override
  State<AddCarEditCarWidget> createState() => _AddCarEditCarWidgetState();
}

class _AddCarEditCarWidgetState extends State<AddCarEditCarWidget> {
  final TextEditingController carBrandController = TextEditingController();
  final TextEditingController carModelNameController = TextEditingController();
  final TextEditingController carColorController = TextEditingController();
  final TextEditingController carYearController = TextEditingController();
  final TextEditingController carPriceController = TextEditingController();
  final TextEditingController carFuelController = TextEditingController();
  final TextEditingController carKilometerController = TextEditingController();
  final GlobalKey<FormState> postCarFormkey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.isEditPage == true) {
      carBrandController.text = widget.data!['brand'];
      carModelNameController.text = widget.data!['modelName'];
      carColorController.text = widget.data!['color'];
      carYearController.text = widget.data!['year'];
      carPriceController.text = widget.data!['price'];
      carFuelController.text = widget.data!['fuel'];
      carKilometerController.text = widget.data!['kilometer'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            flexibleSpace: const AppBarGradientColor(),
            leading: IconButton(
                onPressed: () {
                  widget.sellerHomeScreenBloc.add(BackArrowClickedEvent());
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            title: widget.isEditPage
                ? const MyTextWidget(
                    text: 'Edit Car Details',
                    color: Colors.white,
                    size: 20,
                    weight: FontWeight.bold)
                : const MyTextWidget(
                    text: 'Post New Car',
                    color: Colors.white,
                    size: 20,
                    weight: FontWeight.bold),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: widget.screenSize.height / 6.5,
                      width: widget.screenSize.width / 1.8,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/post new car.jpg'),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high)),
                    ),
                    widget.isEditPage
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                addImage();
                              },
                              child: Container(
                                height: widget.screenSize.height / 6,
                                width: widget.screenSize.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(widget.data!['image']),
                                        fit: BoxFit.cover)),
                                child: const Center(
                                    child: MyTextWidget(
                                        text: 'Change Photo',
                                        color: Colors.white,
                                        size: 15,
                                        weight: FontWeight.bold)),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: imageUrl == ''
                                ? Container(
                                    height: widget.screenSize.height / 6,
                                    width: widget.screenSize.width,
                                    color: Colors.transparent,
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: const Color(0XFFDBEDF5),
                                      child: InkWell(
                                        onTap: () {
                                          addImage();
                                        },
                                        child: const Center(
                                            child: MyTextWidget(
                                                text: 'Add Photo',
                                                color: Color(0xFF424141),
                                                size: 15,
                                                weight: FontWeight.w500)),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: widget.screenSize.height / 6,
                                    width: widget.screenSize.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(imageUrl),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFF424141))),
                                  )),
                    AddEditFormWidget(
                        screenSize: widget.screenSize,
                        postCarFormkey: postCarFormkey,
                        carBrandController: carBrandController,
                        carColorController: carColorController,
                        carFuelController: carFuelController,
                        carKilometerController: carKilometerController,
                        carModelNameController: carModelNameController,
                        carPriceController: carPriceController,
                        carYearController: carYearController),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: widget.isEditPage
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: widget.screenSize.height / 17,
                      width: widget.screenSize.width / 1.5,
                      color: Colors.transparent,
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.blue,
                        child: InkWell(
                            onTap: () {
                              updateCarDetails(
                                  context,
                                  widget.data!.id,
                                  postCarFormkey,
                                  carBrandController,
                                  carModelNameController,
                                  carColorController,
                                  carYearController,
                                  carPriceController,
                                  carFuelController,
                                  carKilometerController);
                            },
                            child: const Center(
                              child: MyTextWidget(
                                  text: 'Edit Car Details',
                                  color: Colors.white,
                                  size: 17,
                                  weight: FontWeight.bold),
                            )),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: widget.screenSize.height / 17,
                      width: widget.screenSize.width / 1.5,
                      color: Colors.transparent,
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.redAccent,
                        child: InkWell(
                            onTap: () {
                              widget.sellerHomeScreenBloc
                                  .add(PostNewCarButtonClickedEvent(
                                postCarFormkey: postCarFormkey,
                                carBrandController: carBrandController,
                                carColorController: carColorController,
                                carFuelController: carFuelController,
                                carKilometerController: carKilometerController,
                                carModelNameController: carModelNameController,
                                carPriceController: carPriceController,
                                carYearController: carYearController,
                              ));                              
                            },
                            child: const Center(
                              child: MyTextWidget(
                                  text: 'Post New Car',
                                  color: Colors.white,
                                  size: 17,
                                  weight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
