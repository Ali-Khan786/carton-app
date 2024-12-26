import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'first_page.dart';



class FpThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cardboard Price Calculator'),
          backgroundColor: Colors.green.shade100,
        ),
        body: PriceCalculatorUI(),
      ),
    );
  }
}

class PriceCalculatorUI extends StatefulWidget {
  @override
  _PriceCalculatorUIState createState() => _PriceCalculatorUIState();
}

class _PriceCalculatorUIState extends State<PriceCalculatorUI> {
  int? numberOfPapers = 3; // Changed to nullable int

  void updateNumberOfPapers(int? ply) {
    setState(() {
      numberOfPapers = ply;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ply Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio<int?>(
                    value: 3,
                    groupValue: numberOfPapers,
                    onChanged: updateNumberOfPapers, // Updated to accept nullable int
                  ),
                  Text('3 Ply'),
                ],
              ),
              Row(
                children: [
                  Radio<int?>(
                    value: 5,
                    groupValue: numberOfPapers,
                    onChanged: updateNumberOfPapers, // Updated to accept nullable int
                  ),
                  Text('5 Ply'),
                ],
              ),
              Row(
                children: [
                  Radio<int?>(
                    value: 7,
                    groupValue: numberOfPapers,
                    onChanged: updateNumberOfPapers, // Updated to accept nullable int
                  ),
                  Text('7 Ply'),
                ],
              ),
            ],
          ),

          // Paper Inputs
          Expanded(
            child: ListView.builder(
              itemCount: numberOfPapers,
              itemBuilder: (context, index) {
                return PaperInputField(index: index + 1);
              },
            ),
          ),

          // Additional Inputs
          Divider(),
          Column(
            children: [
              buildTextField(label: "Corrugation Cost/PC", initialValue: "2.4"),
              buildTextField(label: "Plant Cost (PSI)", initialValue: "48"),
              buildTextField(label: "Making/CTN", initialValue: "5.0"),
              buildTextField(label: "Profit %", initialValue: "15"),
            ],
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(FirstPage());
                },
                child: Text('BACK'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
              ),
              ElevatedButton(
                onPressed: () {
                  // Show functionality
                },
                child: Text("Show"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Copy functionality
                },
                child: Text("Copy"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField({required String label, required String initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(text: initialValue),
      ),
    );
  }
}

class PaperInputField extends StatelessWidget {
  final int index;

  const PaperInputField({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Paper $index:"),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Rate/Kg",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "GSM",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "C-Factor",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
