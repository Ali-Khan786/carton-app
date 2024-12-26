import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'PageBController.dart';
import 'first_page.dart';
import 'first_page_second_screen.dart';


class FpSp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carton Specification'),
          backgroundColor: Colors.green.shade100,
        ),
        body: CartonCalculatorUI(),
      ),
    );
  }
}

class CartonCalculatorUI extends StatefulWidget {
  @override
  _CartonCalculatorUIState createState() => _CartonCalculatorUIState();
}

class _CartonCalculatorUIState extends State<CartonCalculatorUI> {
  bool _isReadOnly = true;
  FocusNode _focusNode = FocusNode(); // Create a FocusNode

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_isReadOnly && _focusNode.hasFocus) {
        _focusNode.unfocus(); // Remove focus if readOnly is true
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final dataController = Get.find<FPSController>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Carton Specification and Raw Material
          buildSectionHeader('Carton Specification and Raw Material'),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildRowWithTwoFields('Ply', "${dataController.ply.value}"),
                buildRowWithTwoFields('Size', '${dataController.length}x${dataController.width}x${dataController.height} inch'),
                buildRowWithTwoFields('Sheet', '${dataController.cutSize}x${dataController.rollSize} inch'),
                buildRowWithTwoFields('Quantity', '${dataController.quantity}'),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Costing Details
          buildSectionHeader('Costing Details'),
          Row(
            children: [
              // Left Column
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildRowWithTwoFields('Roll 1', '${dataController.rollRate}'),
                      buildRowWithTwoFields('Paper', '${dataController.paperRate}'),
                      buildRowWithTwoFields('Silicate', '${dataController.silicateRate}'),
                      buildRowWithTwoFields('Cost [PSI]', '${dataController.costPSI}'),
                      buildRowWithTwoFields('Cost', '${dataController.cost}'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              // Right Column
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildRowWithTwoFields('Labour', '${dataController.labour}'),
                      buildRowWithTwoFields('Printing / Carr', '${dataController.printing}'),
                      buildRowWithTwoFields('Waste [${dataController.wastagePer}%]', '${dataController.wastage}'),
                      buildRowWithTwoFields('Profit [${dataController.profitPer}%]', '${dataController.profit}'),
                      buildRowWithTwoFields('Price [PSI]', '${dataController.pricePSI}'),
                      buildRowWithTwoFields('Price', '${dataController.price}'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  // Back button functionality
                },
                child: Text('BACK'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Copy button functionality
              //   },
              //   child: Text('COPY'),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.green.shade100,
              //   ),
              // ),
            ],
          ),

          SizedBox(height: 16),

          // Save Button

        ],
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildRowWithTwoFields(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: TextField(
              readOnly: true,
              focusNode: _focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              controller: TextEditingController(text: initialValue),
            ),
          ),
        ],
      ),
    );
  }
}
