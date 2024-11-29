import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
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
            // Company Information Section
            _buildSectionHeader("Company Information"),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                labelText: "Company Name",
                hintText: "My Packages",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Carton Making Section
            _buildSectionHeader("Carton Making"),
            _buildTwoColumnTable([
              ["3 Ply Double", "0", "0 Ply Single", "0"],
              ["5 Ply Double", "0", "0 Ply Single", "0"],
              ["7 Ply Double", "0", "0 Ply Single", "0"],
            ]),
            SizedBox(height: 16),

            // Sheet Making Section
            _buildSectionHeader("Sheet Making"),
            _buildTwoColumnTable([
              ["0 Ply Sheet", ".0", "3 Ply Stiffener", ".0"],
              ["0 Ply Sheet", ".0", "5 Ply Stiffener", ".0"],
              ["0 Ply Sheet", ".0", "7 Ply Stiffener", "0"],
            ]),
            SizedBox(height: 16),

            // Carton Items Section
            _buildSectionHeader("Carton Items"),
            _buildTwoColumnTable([
              ["Silicate", "0", "Plant Silicate", "0"],
              ["Waste %", "0", "Profit %", "0"],
              ["GST %", "0", "", ""],
            ]),
            SizedBox(height: 16),

            // Roll Labour Section
            _buildSectionHeader("Roll Labour"),
            _buildTwoColumnTable([
              ["Per Roll Rate", "0", "C-Factor", "0"],
            ]),
            SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("BACK"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("RESET"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("SAVE"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  ),
                ),
              ],
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
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  // Helper function to build a table with two columns
  Widget _buildTwoColumnTable(List<List<String>> rows) {
    return Column(
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Expanded(
                child: _buildTableItem(row[0], row[1]),
              ),
              SizedBox(width: 8),
              Expanded(
                child: row.length > 2 ? _buildTableItem(row[2], row[3]) : Container(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Helper function to build a single table cell
  Widget _buildTableItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: value,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
        ),
      ],
    );
  }
}

