import 'package:auto_mates/seller/seller_profile_screen/controllers/functions.dart';
import 'package:auto_mates/user/commonwidgets/custom_alertdialog/custom_alert_dialog.dart';
import 'package:auto_mates/user/commonwidgets/my_text_widget/my_text_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SoldCarHolder extends StatelessWidget {
  const SoldCarHolder({super.key, required this.screenSize, required this.car});
  final Size screenSize;
  final dynamic car;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        soldCarProfitChart(context);
      },
      child: Card(
        color: const Color.fromARGB(255, 241, 241, 241),
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenSize.width / 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenSize.width / 100),
                    child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 800),
                        height: screenSize.height / 9,
                        width: screenSize.width / 3.2,
                        placeholder: const AssetImage(
                          'assets/images/image placeholder.jpeg',
                        ),
                        placeholderFit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          );
                        },
                        image: NetworkImage(car['thumbnail']),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenSize.width / 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MyTextWidget(
                                text: car['brand'],
                                color: Colors.blueGrey,
                                size: screenSize.width / 23,
                                weight: FontWeight.w500),
                            SizedBox(
                              width: screenSize.width / 90,
                            ),
                            MyTextWidget(
                                text: car['modelName'],
                                color: Colors.blueGrey,
                                size: screenSize.width / 25,
                                weight: FontWeight.w500),
                          ],
                        ),
                        MyTextWidget(
                            text: car['regNumber'],
                            color: Colors.blueGrey,
                            size: screenSize.width / 30,
                            weight: FontWeight.bold),
                        MyTextWidget(
                            text: 'Bought Price: ₹${car['boughtPrice']} Lakh',
                            color: Colors.blueGrey,
                            size: screenSize.width / 35,
                            weight: FontWeight.bold),
                        MyTextWidget(
                            text: 'Customer Price: ₹${car['price']} Lakh',
                            color: Colors.blueGrey,
                            size: screenSize.width / 35,
                            weight: FontWeight.bold),
                        MyTextWidget(
                            text: 'Sold For: ₹${car['soldAmount']}',
                            color: Colors.green,
                            size: screenSize.width / 25,
                            weight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => CustomAlertDialog(
                          image: 'assets/images/bin.png',
                          title: 'Remove the sold car',
                          subtitle: 'Do you want to remove the sold car',
                          screenSize: screenSize,
                          soldCardata: car,
                          isSoldcarRemoving: true,
                        ),
                      );
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> soldCarProfitChart(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        double boughtPrice = parsePrice(car['boughtPrice']);
        double customerPrice = parsePrice(car['price']);
        double soldPrice = parsePrice(car['soldAmount']);
        double profit = soldPrice - boughtPrice;

        return SoldCarProfitChart(
            screenSize: screenSize,
            boughtPrice: boughtPrice,
            customerPrice: customerPrice,
            soldPrice: soldPrice,
            profit: profit);
      },
    );
  }
}

class SoldCarProfitChart extends StatelessWidget {
  const SoldCarProfitChart({
    super.key,
    required this.screenSize,
    required this.boughtPrice,
    required this.customerPrice,
    required this.soldPrice,
    required this.profit,
  });

  final Size screenSize;
  final double boughtPrice;
  final double customerPrice;
  final double soldPrice;
  final double profit;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(screenSize.width / 50),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width/75),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: Center(child: MyTextWidget(text: 'Car Price Breakdown', color: Colors.blueGrey, size: screenSize.width/20, weight:FontWeight.bold))),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  icon: Icon(Icons.close,color: Colors.red,size: screenSize.width/10,)
                )
              ],
            ),
            SizedBox(height: screenSize.height/25),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: boughtPrice,
                          color: Colors.blue,
                          width: screenSize.width / 100,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: customerPrice,
                          color: Colors.orange,
                          width: screenSize.width / 100,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: soldPrice,
                          color: Colors.green,
                          width: screenSize.width / 100,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: profit,
                          color: Colors.red,
                          width: screenSize.width / 100,
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return MyTextWidget(text: 'Bought', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold);
                            case 1:
                              return MyTextWidget(text: 'Customer', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold);
                            case 2:
                              return MyTextWidget(text: 'Sold', color: Colors.blueGrey, size: screenSize.width/35, weight: FontWeight.bold);
                            case 3:
                              return MyTextWidget(text: 'Profit', color: Colors.green, size: screenSize.width/35, weight: FontWeight.bold);
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}