import 'package:flutter/material.dart';

class FifthPage extends StatelessWidget {
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
              // Add menu functionality if needed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Text(
                  "Paper Sheets to Weight Conversion",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Table Header
              Container(
                color: Colors.grey[300],
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Length [inch]",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Width [inch]",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "GSM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Quantity",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Rate",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),

              // Table Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildInputField("Length")),
                  SizedBox(width: 8),
                  Expanded(child: _buildInputField("Width")),
                  SizedBox(width: 8),
                  Expanded(child: _buildInputField("GSM")),
                  SizedBox(width: 8),
                  Expanded(child: _buildInputField("Qty")),
                  SizedBox(width: 8),
                  Expanded(child: _buildInputField("Rate")),
                ],
              ),
              SizedBox(height: 16),

              // 1 Paper Weight and Amount
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledInputField("1 Paper Weight", ""),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildLabeledInputField("1 Paper Amount", ""),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Packet Weight and Amount
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledInputField("Packet Weight[kg]", ""),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildLabeledInputField("Packet Amount", ""),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Total Weight and Amount
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledInputField("Total Weight[kg]", ""),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildLabeledInputField("Total Amount", ""),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildInputField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      ),
    );
  }

  // Helper method for labeled input fields
  Widget _buildLabeledInputField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
        ),
      ],
    );
  }
}


