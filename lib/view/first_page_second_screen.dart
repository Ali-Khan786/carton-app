import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
  double ply =3;
  // Default selected value for radio buttons
  final TextEditingController paperRateCon = TextEditingController();
  final TextEditingController paperGSMCon = TextEditingController();
  final TextEditingController makingCTNCon = TextEditingController(text: "4.0");
  final TextEditingController printingCon = TextEditingController(text: "0");
  final TextEditingController silicateCon = TextEditingController(text: "48");
  final TextEditingController wastageCon = TextEditingController(text: "1");
  final TextEditingController profitCOn = TextEditingController(text: "15");
  final TextEditingController rollRate1Con = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final dataController = Get.find<FPSController>();
    double? makingCTN = double.tryParse(makingCTNCon.text)??0.0;
    double? printing = double.tryParse(printingCon.text)??0.0;
    double? profit = double.tryParse(profitCOn.text)?? 0.0;
    double? wastage1 = double.tryParse(wastageCon.text)??0.0;
    num paperCostCal(){
      double? paperRate = double.tryParse(paperRateCon.text);
      double? paperGSM = double.tryParse(paperGSMCon.text);
      if(paperRate!=  null&& paperGSM!=null){
        return ((dataController.cutSize*dataController.rollSize.value*paperGSM)/15500)*(paperRate/100);
      }else{
      return  0;
    }}
    num ply2Rate(){
      double? rollRate1 = double.tryParse(rollRate1Con.text);
      if(rollRate1!=  null){
        return (rollRate1*dataController.rollSize.value/2400)*dataController.cutSize.value;
      }else{
        return  0;
      }
    }
    num silicateRate(){
      double? silicate = double.tryParse(silicateCon.text);
      if(silicate!=  null){
        return (silicate/10000)*dataController.rollSize.value*dataController.cutSize.value*1;
      }else{
        return  0;
      }
    }



    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green[100],
      ),
      drawer: Drawer(), // Placeholder for drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'No. of Ply',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                buildRadio('3 ply'),
                buildRadio('5 ply'),
                buildRadio('7 ply'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildTextFieldRow(),
                  SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: paperRateCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Paper Rate [Center Paper]",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: paperGSMCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "GSM of inner Paper",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Highlighted Section 2
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: makingCTNCon,
                    decoration: InputDecoration(
                      labelText: "Making/CTN",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: printingCon,
                    decoration: InputDecoration(
                      labelText: "Printing /Carr.",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Highlighted Section 3
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: silicateCon,
                    decoration: InputDecoration(
                      labelText: "silicate [Gum] Rate Per Kg",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: wastageCon,
                    decoration: InputDecoration(
                      labelText: "wastage %",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: profitCOn,
                    decoration: InputDecoration(
                      labelText: "profit %",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();//
                          // Navigate to FirstPage
                        },
                        child: Text('BACK'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //
                      //     // Handle COPY action
                      //   },
                      //   child: Text('COPY'),
                      //   style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          num x=paperCostCal();
                          num y=ply2Rate();
                          num z=silicateRate();
                          double cost = y.toDouble() + x +  z;
                          double costPSI = cost/(dataController.rollSize.value*dataController.cutSize.value);
                          double profit1 = cost * ((profit)/100);
                          double wastage2 = cost * ((wastage1)/100);
                          double price = makingCTN + printing + wastage2+ profit1 +cost;
                          double pricePSI = price/(dataController.rollSize.value*dataController.cutSize.value);
                          double? paperRate = double.tryParse(paperRateCon.text);
                          double? paperGSM = double.tryParse(paperGSMCon.text);
                          double? rollRate1 = double.tryParse(rollRate1Con.text);
                          print(cost);
                          if(rollRate1!=  null&&paperRate!=  null&& paperGSM!=null){
                            dataController.updateData2(ply,  y.toDouble(),  x.toDouble(),z.toDouble(), costPSI,
                                cost, makingCTN, printing,wastage1, wastage2,
                                profit, profit1, pricePSI,price.toDouble());
                            Get.to(FpSp());// Navigate to another page
                          }
                        },
                        child: Text('SHOW'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                      ),
                    ],
                  ),
                            ],
        ),
      ),


          ],
        ),
      ),
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
