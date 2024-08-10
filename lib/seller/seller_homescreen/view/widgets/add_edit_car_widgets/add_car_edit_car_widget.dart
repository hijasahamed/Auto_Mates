import 'dart:io';

import 'package:auto_mates/seller/seller_homescreen/controller/functions.dart';
import 'package:auto_mates/seller/seller_homescreen/view/bloc/seller_home_screen_bloc.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/car_edit_page_thumbnail_images/car_edit_page_thumbnail_images.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/car_thumnail_images_holder/thumbnail_images_holder.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/post_car_banner/post_car_banner.dart';
import 'package:auto_mates/seller/seller_homescreen/view/widgets/add_edit_car_widgets/textformfields/add_edit_form_widget.dart';
import 'package:auto_mates/user/appbarbottombar/view/widgets/normal_app_bar/normal_app_bar.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
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
  final dynamic data;
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
  final TextEditingController regNumberController = TextEditingController();
  final TextEditingController numOfOwnerController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController insuranceController = TextEditingController();
  final TextEditingController seatCapacityController = TextEditingController();
  final TextEditingController milageController = TextEditingController();
  final TextEditingController sunroofController = TextEditingController();
  final TextEditingController bootspaceController = TextEditingController();
  final TextEditingController infotainmentSystemController =
      TextEditingController();
  final TextEditingController alloyWheelController = TextEditingController();
  final TextEditingController carheightController = TextEditingController();
  final TextEditingController carWidthController = TextEditingController();
  final TextEditingController carLengthController = TextEditingController();
  final TextEditingController groundClearenceController =
      TextEditingController();
  final TextEditingController airBagController = TextEditingController();
  final TextEditingController airConditionerController =
      TextEditingController();
  final TextEditingController powerWindowController = TextEditingController();
  final TextEditingController bodyTypeController = TextEditingController();
  final TextEditingController fuelTankController = TextEditingController();
  final TextEditingController overViewController = TextEditingController();

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
      regNumberController.text = widget.data!['regNumber'];
      numOfOwnerController.text = widget.data!['noOfOwners'];
      transmissionController.text = widget.data!['transmission'];
      insuranceController.text = widget.data!['insurance'];
      seatCapacityController.text = widget.data!['seat'];
      milageController.text = widget.data!['milage'];
      sunroofController.text = widget.data!['sunroof'];
      bootspaceController.text = widget.data!['bootspace'];
      infotainmentSystemController.text = widget.data!['infotainment'];
      alloyWheelController.text = widget.data!['alloywheel'];
      carheightController.text = widget.data!['carheight'];
      carWidthController.text = widget.data!['carwidth'];
      carLengthController.text = widget.data!['carlength'];
      groundClearenceController.text = widget.data!['groundclearance'];
      airBagController.text = widget.data!['airbag'];
      airConditionerController.text = widget.data!['airconditioner'];
      powerWindowController.text = widget.data!['powerwindow'];
      bodyTypeController.text = widget.data!['bodytype'];
      fuelTankController.text = widget.data!['fueltank'];
      overViewController.text = widget.data!['overview'];
    }
    super.initState();
  }

  @override
  void dispose() {
    selectedImages.clear();
    thumbnailImage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerHomeScreenBloc, SellerHomeScreenState>(
      builder: (context, state) {
        SellerHomeScreenBloc homescreenBloc = SellerHomeScreenBloc();
        SellerHomeScreenBloc editButtonCircleLoaderBlocObj = SellerHomeScreenBloc();
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBar: (widget.isEditPage == true)
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(55),
                  child: NormalAppBar(title: 'Edit Car Details'))
              : const PreferredSize(
                  preferredSize: Size.fromHeight(55),
                  child: NormalAppBar(title: 'Post New Car')),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    PostCarBanner(screenSize: widget.screenSize),
                    widget.isEditPage
                        ? CarEditPageThumbnailImages(
                            screenSize: widget.screenSize, data: widget.data)
                        : ThumbnailImagesHolder(
                            screenSize: widget.screenSize,
                            homescreenBloc: homescreenBloc),
                    AddEditFormWidget(
                      postCarFormkey: postCarFormkey,
                      carBrandController: carBrandController,
                      carColorController: carColorController,
                      carFuelController: carFuelController,
                      carKilometerController: carKilometerController,
                      carModelNameController: carModelNameController,
                      carPriceController: carPriceController,
                      carYearController: carYearController,
                      screenSize: widget.screenSize,
                      regNumberController: regNumberController,
                      numOfOwnerController: numOfOwnerController,
                      transmissionController: transmissionController,
                      insuranceController: insuranceController,
                      seatCapacityController: seatCapacityController,
                      milageController: milageController,
                      sunroofController: sunroofController,
                      bootspaceController: bootspaceController,
                      infotainmentSystemController:
                          infotainmentSystemController,
                      alloyWheelController: alloyWheelController,
                      carHeightController: carheightController,
                      carWidthController: carWidthController,
                      carLengthController: carLengthController,
                      groundClearanceController: groundClearenceController,
                      airBagController: airBagController,
                      airConditionerController: airConditionerController,
                      powerWindowController: powerWindowController,
                      bodyTypeController: bodyTypeController,
                      fuelTankController: fuelTankController,
                      overViewController: overViewController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: widget.isEditPage
                ? Container(
                  width: widget.screenSize.width / 1.5,
                  color: Colors.transparent,
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.blue,
                    child: InkWell(
                        onTap: () {
                          editButtonCircleLoaderBlocObj.add(EditingCarDataEditButtonCircleIndicatorEvent());
                          if (thumbnailImage == null &&
                              selectedImages.isEmpty) {
                            thumbnailImage = widget.data['thumbnail'];
                            if (widget.data['image'] != null &&
                                widget.data['image'] is List) {
                              selectedImages.addAll(
                                  List<File>.from(widget.data['image'])
                                      as Iterable<File>);
                            }
                          }
                          updateCarDetails(
                              context: context,
                              docId: widget.data!.id,
                              postCarFormkey: postCarFormkey,
                              carBrandController: carBrandController,
                              carColorController: carColorController,
                              carFuelController: carFuelController,
                              carKilometerController:
                                  carKilometerController,
                              carModelNameController:
                                  carModelNameController,
                              carPriceController: carPriceController,
                              carYearController: carYearController,
                              regNumberController: regNumberController,
                              numOfOwnerController: numOfOwnerController,
                              transmissionController:
                                  transmissionController,
                              insuranceController: insuranceController,
                              seatCapacityController:
                                  seatCapacityController,
                              milageController: milageController,
                              sunroofController: sunroofController,
                              bootspaceController: bootspaceController,
                              infotainmentSystemController:
                                  infotainmentSystemController,
                              alloyWheelController: alloyWheelController,
                              carHeightController: carheightController,
                              carWidthController: carWidthController,
                              carLengthController: carLengthController,
                              groundClearanceController:
                                  groundClearenceController,
                              airBagController: airBagController,
                              airConditionerController:
                                  airConditionerController,
                              powerWindowController: powerWindowController,
                              bodyTypeController: bodyTypeController,
                              fuelTankController: fuelTankController,
                              overViewController: overViewController);
                        },
                        child: Center(
                          child: BlocConsumer<SellerHomeScreenBloc, SellerHomeScreenState>(
                            bloc: editButtonCircleLoaderBlocObj,
                            listener: (context, state) {},
                            builder: (context, state) {
                              if(state is EditingCarDataEditButtonCircleIndicatorState){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyTextWidget(text: 'Updating Details', color: Colors.white, size: widget.screenSize.width/30, weight: FontWeight.bold),
                                    SizedBox(width: widget.screenSize.width/40,),
                                    SizedBox(
                                      height: widget.screenSize.width/17,
                                      width: widget.screenSize.width/17,
                                      child: CircularProgressIndicator(color: Colors.white,strokeWidth: widget.screenSize.width/130,)
                                    ),
                                  ],
                                );
                              }
                              return MyTextWidget(
                                  text: 'Edit Car Details',
                                  color: Colors.white,
                                  size: widget.screenSize.width/30,
                                  weight: FontWeight.bold);
                            },
                          ),
                        )),
                  ),
                )
                : BlocProvider(
                    create: (context) => widget.sellerHomeScreenBloc,
                    child: BlocListener<SellerHomeScreenBloc,
                        SellerHomeScreenState>(
                      bloc: widget.sellerHomeScreenBloc,
                      listener: (context, state) {
                        if (state is PostingCarLoadingState) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              );
                            },
                          );
                        } else if (state is PostingCarStopLoadingState) {
                          Navigator.pop(context);
                        }
                      },
                      child: BlocBuilder<SellerHomeScreenBloc,
                          SellerHomeScreenState>(
                        bloc: widget.sellerHomeScreenBloc,
                        builder: (context, state) {
                          return Container(
                            color: Colors.transparent,
                            child: Material(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.green,
                              child: InkWell(
                                  onTap: () {
                                    widget.sellerHomeScreenBloc
                                        .add(PostingCarLoadingEvent());
                                    postNewCar(
                                        context: context,
                                        postCarFormkey: postCarFormkey,
                                        carBrandController:
                                            carBrandController,
                                        carModelNameController:
                                            carModelNameController,
                                        carColorController:
                                            carColorController,
                                        carYearController: carYearController,
                                        carPriceController:
                                            carPriceController,
                                        carFuelController: carFuelController,
                                        carKilometerController:
                                            carKilometerController,
                                        regNumberController:
                                            regNumberController,
                                        numOfOwnerController:
                                            numOfOwnerController,
                                        transmissionController:
                                            transmissionController,
                                        insuranceController:
                                            insuranceController,
                                        seatCapacityController:
                                            seatCapacityController,
                                        milageController: milageController,
                                        sunroofController: sunroofController,
                                        bootspaceController:
                                            bootspaceController,
                                        infotainmentSystemController:
                                            infotainmentSystemController,
                                        alloyWheelController:
                                            alloyWheelController,
                                        carHeightController:
                                            carheightController,
                                        carWidthController:
                                            carWidthController,
                                        carLengthController:
                                            carLengthController,
                                        groundClearanceController:
                                            groundClearenceController,
                                        airBagController: airBagController,
                                        airConditionerController:
                                            airConditionerController,
                                        powerWindowController:
                                            powerWindowController,
                                        bodyTypeController:
                                            bodyTypeController,
                                        fuelTankController:
                                            fuelTankController,
                                        overViewController:
                                            overViewController,
                                        sellerHomeScreenBloc:
                                            widget.sellerHomeScreenBloc);
                                  },
                                  child: Center(
                                    child: MyTextWidget(
                                        text: 'Post New Car',
                                        color: Colors.white,
                                        size: widget.screenSize.width/30,
                                        weight: FontWeight.bold),
                                  )),
                            ),
                          );
                        },
                      ),
                    )),
          ),
        );
      },
    );
  }
}
