import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carton Size Input Section
              Text(
                "Carton Size (L x W x H)",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Length",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Width",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Height",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Measurement Unit Section
              Text(
                "Measurement Unit",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: "inch",
                      groupValue: "unit",
                      onChanged: (value) {},
                      title: Text("inch"),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: "cm",
                      groupValue: "unit",
                      onChanged: (value) {},
                      title: Text("cm"),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: "mm",
                      groupValue: "unit",
                      onChanged: (value) {},
                      title: Text("mm"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Sheet Size Section
              Text(
                "Sheet Size (Cutting x Roll Size)",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Cut Size",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Deckle/Roll Size",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "*Note: you can also change sheet size manually",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
              SizedBox(height: 16),

              // Quantity Section
              Text(
                "Required Roll and Paper details",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: "Quantity",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              // Buttons Section
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("\n"
                          "RESET"
                          "\n", style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("    Cost\n  Manual\n  Machines",style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("     Cost\n Corrugator\n      Line",style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
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
}