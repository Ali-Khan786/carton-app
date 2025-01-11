import 'package:flutter/material.dart';
import 'package:flutter_class_project/view/result_stif.dart';
import 'package:get/get.dart';

import 'PageBController.dart';

class FourthSecondPage extends StatefulWidget {
  @override
  _FourthSecondPageState createState() => _FourthSecondPageState();
}

class _FourthSecondPageState extends State<FourthSecondPage> {
  double ply = 3;
  final dataController = Get.find<FPSController>();
  // Controllers for each field
  final TextEditingController rollRate1Con = TextEditingController();
  final TextEditingController paperRateCon = TextEditingController();
  final TextEditingController gsmInnerPaperCon = TextEditingController();
  final TextEditingController makingCtnCon =
      TextEditingController(text: "0.75");
  final TextEditingController printingCarrCon =
      TextEditingController(text: "0");
  final TextEditingController silicateRateCon =
      TextEditingController(text: "48");
  final TextEditingController wastageCon = TextEditingController(text: "1");
  final TextEditingController profitCon = TextEditingController(text: "15");

  String selectedPly = '3 ply';

  @override
  Widget build(BuildContext context) {
    final dataController = Get.find<FPSController>();
    double? makinCost = double.tryParse(makingCtnCon.text) ?? 0.0;
    double? printCost = double.tryParse(printingCarrCon.text) ?? 0.0;
    double? silicate = double.tryParse(silicateRateCon.text) ?? 0.0;
    double? profit = double.tryParse(profitCon.text) ?? 0.0;
    double? wastage1 = double.tryParse(wastageCon.text) ?? 0.0;

    num ply2Rate() {
      double? rollRate1 = double.tryParse(rollRate1Con.text);
      if (rollRate1 != null) {
        return (rollRate1 * dataController.rollSize2f.value / 2400) *
            dataController.cutSize2f.value;
      }
      return 0;
    }

    num paperCostCal() {
      double? paperRate = double.tryParse(paperRateCon.text);
      double? paperGSM = double.tryParse(gsmInnerPaperCon.text);
      if (paperRate != null && paperGSM != null) {
        return ((dataController.cutSize2f *
                    dataController.rollSize2f.value *
                    paperGSM) /
                15500) *
            (paperRate / 100);
      }
      return 0;
    }

    num silicateRate() {
      double? silicate = double.tryParse(silicateRateCon.text);
      if (silicate != null) {
        return (silicate / 10000) *
            dataController.rollSize2f.value *
            dataController.cutSize2f.value;
      }
      return 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.green[100],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/cardboard stiffenar.png',
                    width: 150,
                    height: 150,
                  ),
                  Image.asset(
                    'assets/cardboard roll.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'No. of Ply',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: '3 ply',
                        groupValue: selectedPly,
                        onChanged: (newValue) {
                          setState(() {
                            selectedPly = newValue!;
                          });
                        },
                      ),
                      Text('3 ply'),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Corru. Roll (Roll1 [2ply])",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildTextFieldRow(),
              SizedBox(height: 8),
              buildInputRow(
                  controller1: paperRateCon,
                  label1: "Paper Rate [Center Paper]",
                  controller2: gsmInnerPaperCon,
                  label2: "GSM of Inner Paper"),
              SizedBox(height: 16),
              buildInputRow(
                  controller1: makingCtnCon,
                  label1: "Making/CTN",
                  controller2: printingCarrCon,
                  label2: "Printing / Carr."),
              SizedBox(height: 16),
              buildInputRow(
                  controller1: silicateRateCon,
                  label1: "Silicate [Gum] Rate Per Kg",
                  controller2: wastageCon,
                  label2: "Wastage %"),
              SizedBox(height: 8),
              buildInputRow(controller1: profitCon, label1: "Profit %"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Back"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[100]),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        num x = paperCostCal();
                        num y = ply2Rate();
                        num z = silicateRate();
                        double cost = y.toDouble() + x + z;
                        double costPSI = cost /
                            (dataController.rollSize2f.value *
                                dataController.cutSize2f.value);
                        double profit1 = cost * ((profit ?? 0) / 100);
                        double wastage2 = cost * ((wastage1 ?? 0) / 100);
                        double price = (makinCost ?? 0) +
                            (printCost ?? 0) +
                            wastage2 +
                            profit1 +
                            cost;
                        double pricePSI = price /
                            (dataController.rollSize2f.value *
                                dataController.cutSize2f.value);

                        double? paperRate = double.tryParse(paperRateCon.text);
                        double? paperGSM = double.tryParse(gsmInnerPaperCon.text);
                        double? rollRate1 = double.tryParse(rollRate1Con.text);

                        if (rollRate1 != null &&
                            paperRate != null &&
                            paperGSM != null) {
                          dataController.updateData2(
                            ply,
                            y.toDouble(),
                            x.toDouble(),
                            z.toDouble(),
                            costPSI,
                            cost,
                            makinCost ?? 0,
                            printCost ?? 0,
                            wastage1 ?? 0,
                            wastage2,
                            profit ?? 0,
                            profit1,
                            pricePSI,
                            price.toDouble(),
                          );
                          Get.to(ResultStif());
                        }
                      },
                      child: Text("Show"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[100]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputRow(
      {required TextEditingController controller1,
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
        if (label2 != null) ...[
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

  Widget buildTextFieldRow() {
    int textFieldCount = selectedPly == '3 ply'
        ? 1
        : selectedPly == '5 ply'
            ? 2
            : 3;
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
}
