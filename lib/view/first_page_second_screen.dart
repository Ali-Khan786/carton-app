import 'package:flutter/material.dart';
import 'package:flutter_class_project/view/Second_screens_nextscreen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class FpSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPly = '3 ply'; // Default selected value for radio buttons

  @override
  Widget build(BuildContext context) {
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
            Text(
              'No. of Ply',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: '3 ply',
                      groupValue: selectedPly,
                      onChanged: (value) {
                        setState(() {
                          selectedPly = value!;
                        });
                      },
                    ),
                    Text('3 ply'),
                  ],
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    Radio<String>(
                      value: '5 ply',
                      groupValue: selectedPly,
                      onChanged: (value) {
                        setState(() {
                          selectedPly = value!;
                        });
                      },
                    ),
                    Text('5 ply'),
                  ],
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    Radio<String>(
                      value: '7 ply',
                      groupValue: selectedPly,
                      onChanged: (value) {
                        setState(() {
                          selectedPly = value!;
                        });
                      },
                    ),
                    Text('7 ply'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 8,),
                  Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade100,width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                    child:   buildInputRow('2 ply Roll Rate [Per Inch]'),
                  ),
                  // Highlighted Section 1

                  SizedBox(height: 8,),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade100, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildInputRow('Paper Rate [Center Paper]'),
                        buildInputRow('GSM of inner Paper'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Highlighted Section 2
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade100, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildInputRow('Making/CTN', initialValue: '4.0'),
                        buildInputRow('Printing /Carr.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Highlighted Section 3
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade100, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildInputRow('Silicate [Gum] Rate Per Kg', initialValue: '48'),
                        buildInputRow('Wastage %', initialValue: '1'),
                      ],
                    ),
                  ),
SizedBox(height: 8,),
                  Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade100,width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                    child:  buildInputRow('Profit %', initialValue: '15'),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('BACK'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('COPY'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(Result());
                  },
                  child: Text('SHOW'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputRow(String label, {String initialValue = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: TextEditingController(text: initialValue),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
