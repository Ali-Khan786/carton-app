import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String _selectedUnit = "inch"; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.green[100],
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add menu functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Size Section
            _buildSectionHeader("Size [L1 + G + L2 x W]"),
            SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: _buildTextField("Length1"),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildTextField("Gazzete"),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildTextField("Length2"),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildTextField("Width"),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Measurement Unit
            _buildSectionHeader("Measurement Unit"),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: "inch",
                        groupValue: _selectedUnit,
                        onChanged: (value) {
                          setState(() {
                            _selectedUnit = value!;
                          });
                        },
                      ),
                      Text("inch"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: "cm",
                        groupValue: _selectedUnit,
                        onChanged: (value) {
                          setState(() {
                            _selectedUnit = value!;
                          });
                        },
                      ),
                      Text("cm"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: "mm",
                        groupValue: _selectedUnit,
                        onChanged: (value) {
                          setState(() {
                            _selectedUnit = value!;
                          });
                        },
                      ),
                      Text("mm"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Sheet Size Section
            _buildSectionHeader("Sheet Size [Cutting x Roll Size]"),
            SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(""),
                ),
                SizedBox(width: 4,),
                Text("X", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 4,),
                Expanded(
                  child: _buildTextField(""),
                ),
              ],
            ),
            SizedBox(height: 16),

            // No. of Sheets Section
            _buildSectionHeader("No of sheets [Cutting x Roll Size]"),
            SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(""),
                ),
                SizedBox(width: 4,),
                Text("X", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 4,),
                Expanded(
                  child: _buildTextField(""),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Note Section
            Text(
              "*Note : you also can change Cut size and number of sheets",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            SizedBox(height: 16),

            // Required Roll and Paper Details Section
            _buildSectionHeader("Required Roll and Paper details"),
            SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                  child: _buildTextField("Quantity"),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("        COST 1\n"
                        " [CORRUGATED\n"
                        "         ROLL]"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("      COST 2\n"
                        " [PAPER ROLL]"
                        "\n"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8,),

            Row(
              children: [
                Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("RESET"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                ),
              ),],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build section headers
  Widget _buildSectionHeader(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  // Helper function to build a text field
  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      ),
    );
  }
}

