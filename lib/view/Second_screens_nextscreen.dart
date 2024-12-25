import 'package:flutter/material.dart';


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
  @override
  Widget build(BuildContext context) {
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
                buildRowWithTwoFields('Ply', '7'),
                buildRowWithTwoFields('Size', '12.0x11.0x5 inch'),
                buildRowWithTwoFields('Sheet', '48.0x16 inch'),
                buildRowWithTwoFields('Quantity', ''),
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
                      buildRowWithTwoFields('Roll 1', '15.36'),
                      buildRowWithTwoFields('Roll 2', '16.64'),
                      buildRowWithTwoFields('Roll 3', '17.92'),
                      buildRowWithTwoFields('Paper', '04.36'),
                      buildRowWithTwoFields('Silicate', '08.22'),
                      buildRowWithTwoFields('Cost [PSI]', '0.0914'),
                      buildRowWithTwoFields('Cost', '70.2'),
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
                      buildRowWithTwoFields('Labour', '07.00'),
                      buildRowWithTwoFields('Printing / Carr', '-'),
                      buildRowWithTwoFields('Waste [1.0%]', '00.70'),
                      buildRowWithTwoFields('Profit [15.0%]', '10.53'),
                      buildRowWithTwoFields('Price [PSI]', '0.1051'),
                      buildRowWithTwoFields('Price', '80.73'),
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
                  // Back button functionality
                },
                child: Text('BACK'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Copy button functionality
                },
                child: Text('COPY'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Save Button
          ElevatedButton(
            onPressed: () {
              // Save button functionality
            },
            child: Text('SAVE'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade100,
              minimumSize: Size(double.infinity, 50), // Full width button
            ),
          ),
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
