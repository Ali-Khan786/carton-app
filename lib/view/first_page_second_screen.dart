import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Second_screens_nextscreen.dart';
import 'first_page.dart';
import 'PageBController.dart';

class FpSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPly = '3 ply';
  double ply = 3;

  final TextEditingController paperRateCon = TextEditingController();
  final TextEditingController paperGSMCon = TextEditingController();
  final TextEditingController makingCTNCon = TextEditingController(text: "4.0");
  final TextEditingController printingCon = TextEditingController(text: "0");
  final TextEditingController silicateCon = TextEditingController(text: "48");
  final TextEditingController wastageCon = TextEditingController(text: "1");
  final TextEditingController profitCon = TextEditingController(text: "15");
  final TextEditingController rollRate1Con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataController = Get.find<FPSController>();

    double? makingCTN = double.tryParse(makingCTNCon.text) ?? 0.0;
    double? printing = double.tryParse(printingCon.text) ?? 0.0;
    double? profit = double.tryParse(profitCon.text) ?? 0.0;
    double? wastage1 = double.tryParse(wastageCon.text) ?? 0.0;

    num paperCostCal() {
      double? paperRate = double.tryParse(paperRateCon.text);
      double? paperGSM = double.tryParse(paperGSMCon.text);
      if (paperRate != null && paperGSM != null) {
        return ((dataController.cutSize *
            dataController.rollSize.value *
            paperGSM) /
            15500) *
            (paperRate / 100);
      }
      return 0;
    }

    num ply2Rate() {
      double? rollRate1 = double.tryParse(rollRate1Con.text);
      if (rollRate1 != null) {
        return (rollRate1 * dataController.rollSize.value / 2400) *
            dataController.cutSize.value;
      }
      return 0;
    }

    num silicateRate() {
      double? silicate = double.tryParse(silicateCon.text);
      if (silicate != null) {
        return (silicate / 10000) *
            dataController.rollSize.value *
            dataController.cutSize.value;
      }
      return 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImagesRow(),
            SizedBox(height: 20),
            buildPlySelector(),
            SizedBox(height: 20),
            Text(
              "Corru. Roll (Roll1 [2ply])",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildTextFieldRow(),
                  SizedBox(height: 8),
                  buildInputRow(
                      controller1: paperRateCon,
                      label1: "Paper Rate [Center Paper]",
                      controller2: paperGSMCon,
                      label2: "GSM of Inner Paper"),
                  SizedBox(height: 16),
                  buildInputRow(
                      controller1: makingCTNCon,
                      label1: "Making/CTN",
                      controller2: printingCon,
                      label2: "Printing / Carr."),
                  SizedBox(height: 16),
                  buildInputRow(
                      controller1: silicateCon,
                      label1: "Silicate [Gum] Rate Per Kg",
                      controller2: wastageCon,
                      label2: "Wastage %"),
                  SizedBox(height: 8),
                  buildInputRow(
                      controller1: profitCon,
                      label1: "Profit %",
                      controller2: null,
                      label2: null),
                  SizedBox(height: 10),
                  buildActionButtons(dataController, makingCTN, printing,
                      profit, wastage1, paperCostCal, ply2Rate, silicateRate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImagesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/cardboard box.png',
          width: 150,
          height: 150,
        ),
        Image.asset(
          'assets/cardboard roll.png',
          width: 100,
          height: 100,
        ),
      ],
    );
  }

  Widget buildPlySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'No. of Ply',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        buildRadio('3 ply'),
      ],
    );
  }

  Widget buildRadio(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedPly,
          onChanged: (newValue) {
            setState(() {
              selectedPly = newValue!;
            });
          },
        ),
        Text(value),
      ],
    );
  }

  Widget buildTextFieldRow() {
    int textFieldCount = selectedPly == '3 ply' ? 1 : selectedPly == '5 ply' ? 2 : 3;
    return Row(
      children: List.generate(
        textFieldCount,
            (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: TextField(
              controller: rollRate1Con,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Roll Rate (per inch)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputRow(
      {required TextEditingController? controller1,
        required String label1,
        TextEditingController? controller2,
        String? label2}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: label1,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        if (controller2 != null && label2 != null) ...[
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: label2,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget buildActionButtons(
      FPSController dataController,
      double? makingCTN,
      double? printing,
      double? profit,
      double? wastage1,
      num Function() paperCostCal,
      num Function() ply2Rate,
      num Function() silicateRate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('BACK'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
        ),
        ElevatedButton(
          onPressed: () {
            num x = paperCostCal();
            num y = ply2Rate();
            num z = silicateRate();
            double cost = y.toDouble() + x + z;
            double costPSI = cost /
                (dataController.rollSize.value * dataController.cutSize.value);
            double profit1 = cost * ((profit ?? 0) / 100);
            double wastage2 = cost * ((wastage1 ?? 0) / 100);
            double price =
                (makingCTN ?? 0) + (printing ?? 0) + wastage2 + profit1 + cost;
            double pricePSI = price /
                (dataController.rollSize.value * dataController.cutSize.value);

            double? paperRate = double.tryParse(paperRateCon.text);
            double? paperGSM = double.tryParse(paperGSMCon.text);
            double? rollRate1 = double.tryParse(rollRate1Con.text);

            if (rollRate1 != null && paperRate != null && paperGSM != null) {
              dataController.updateData2(
                ply,
                y.toDouble(),
                x.toDouble(),
                z.toDouble(),
                costPSI,
                cost,
                makingCTN ?? 0,
                printing ?? 0,
                wastage1 ?? 0,
                wastage2,
                profit ?? 0,
                profit1,
                pricePSI,
                price.toDouble(),
              );
              Get.to(FpSp());
            }
          },
          child: Text('SHOW'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
        ),
      ],
    );
  }
}
