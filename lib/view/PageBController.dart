import 'package:get/get.dart';

class FPSController extends GetxController {
  RxDouble length = 0.0.obs;
  RxDouble width = 0.0.obs;
  RxDouble height = 0.0.obs;
  RxDouble quantity = 0.0.obs;
  RxDouble cutSize = 0.0.obs;
  RxDouble rollSize = 0.0.obs;

  RxDouble ply = 0.0.obs;
  RxDouble rollRate = 0.0.obs;
  RxDouble paperRate = 0.0.obs;
  RxDouble silicateRate = 0.0.obs;
  RxDouble costPSI = 0.0.obs;
  RxDouble cost = 0.0.obs;
  RxDouble labour = 0.0.obs;
  RxDouble printing = 0.0.obs;
  RxDouble wastagePer = 0.0.obs;
  RxDouble wastage = 0.0.obs;
  RxDouble profitPer = 0.0.obs;
  RxDouble profit = 0.0.obs;
  RxDouble pricePSI = 0.0.obs;
  RxDouble price = 0.0.obs;


  // Function to update data
  void updateData(double newLength, double newWidth, double newHeight,double newCutSize, double newRollSize, double newQuantity) {
    length.value = newLength;
    width.value = newWidth;
    height.value = newHeight;
    quantity.value = newQuantity;
    cutSize.value = newCutSize;
    rollSize.value = newRollSize;
  }
  void updateData2(double newPly, double newRollRate, double newPaperRate,double newSilicateRate, double newCostPSI,
  double newCost, double newLabour, double newPrinting,double newWastagePer, double newWastage,
      double newProfitPer, double newProfit, double newpPricePSI,double newPrice) {
    ply.value = newPly;
    rollRate.value = newRollRate;
    paperRate.value = newPaperRate;
    silicateRate.value = newSilicateRate;
    costPSI.value = newCostPSI;
    cost.value = newCost;
    labour.value = newLabour;
    printing.value = newPrinting;
    wastagePer.value = newWastagePer;
    wastage.value = newWastage;
    profitPer.value = newProfitPer;
    profit.value = newProfit;
    pricePSI.value = newpPricePSI;
    price.value = newPrice;
  }
  RxDouble lengthf = 0.0.obs;
  RxDouble length2f = 0.0.obs;
  RxDouble gazzetef = 0.0.obs;
  RxDouble widthf = 0.0.obs;
  RxDouble cutSizef = 0.0.obs;
  RxDouble rollSizef = 0.0.obs;
  RxDouble cutSize1f = 0.0.obs;
  RxDouble rollSize1f = 0.0.obs;
  RxDouble cutSize2f = 0.0.obs;
  RxDouble rollSize2f = 0.0.obs;

  void stifnerData(double length, double length2, double gazzete,
      double width, double cutSize, double rollSize, double cutSize1, double rollSize1) {
    lengthf.value = length;
    length2f.value = length2;
    gazzetef.value = gazzete;
    widthf.value = width;
    cutSizef.value = cutSize;
    rollSizef.value = rollSize;
    cutSize1f.value = cutSize1;
    rollSize1f.value = rollSize1;
    cutSize2f.value = cutSize/cutSize1;
    rollSize2f.value = rollSize/rollSize1;
  }
}
