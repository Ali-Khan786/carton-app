import 'package:flutter/material.dart';
import 'package:flutter_class_project/view/first_page_second_screen.dart';
import 'package:flutter_class_project/view/first_page_third_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'PageBController.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // final FirstPageController controller = Get.put(FirstPageController());
  final TextEditingController lengthCon = TextEditingController();
  final TextEditingController widthCon = TextEditingController();
  final TextEditingController heightCon = TextEditingController();

  final TextEditingController cutSizeCon = TextEditingController();
  final TextEditingController rollSizeCon = TextEditingController();
  final TextEditingController quantityCon = TextEditingController();
  String unit = "inch";
  num upm = 2;
  void onTextChanged(String value) {
    print("Text changed: $value");
    double? length = double.tryParse(lengthCon.text);
    double? width = double.tryParse(widthCon.text);
    double? height = double.tryParse(heightCon.text);
    if(length != null && width != null && height != null ){
      num sl = sheetL();
      num sw = sheetW();
      print(sw.toString()+"  sdadadasd " + sl.toString());
      updateTextField(sl.toString(),sw.toString());
    }
    else{
      print("enter l, w, h");

    }
    // You can also add your custom logic here
  }
  void updateTextField(sl,sw) {
    setState(() {
      cutSizeCon.text = sl; // Set the value to the text field
      rollSizeCon.text = sw; // Set the value to the text field
    });
  }
  num sheetL() {
    double? length = double.tryParse(lengthCon.text);
    double? width = double.tryParse(widthCon.text);

    if (length != null && width != null) {
      print(length.toString()  + " sdasadsa " + width.toString());
      return 2 * (length + width) + upm;
    } else {
      return 0;
    }
  }

  num sheetW() {
    double? width = double.tryParse(widthCon.text);
    double? height = double.tryParse(heightCon.text);

    if (width != null && height != null) {
      return width + height;
    } else {
      return 0;
    }
  }

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
                          keyboardType: TextInputType.number,
                          controller: lengthCon,
                          decoration: InputDecoration(
                            labelText: "Length",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: widthCon,
                          decoration: InputDecoration(
                            labelText: "Width",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: heightCon,
                          onChanged: onTextChanged,
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
                          groupValue: unit,
                          onChanged: (value) {
                            setState(() {
                              unit = value.toString();
                              upm = 2.0;
                              print(unit +" "+ upm.toString());
                              onTextChanged("value");
                            });
                          },
                          title: Text("inch"),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: "cm",
                          groupValue: unit,
                          onChanged: (value) {
                            setState(() {
                              unit = value.toString();
                              upm = 5.08;
                              print(unit +" "+ upm.toString());
                              onTextChanged("value");
                            });
                          },
                          title: Text("cm"),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: "mm",
                          groupValue: unit,
                          onChanged: (value) {
                            setState(() {
                              unit = value.toString();
                              print(unit);
                              upm = 50.8;
                              print(unit +" "+ upm.toString());
                              onTextChanged("value");
                            });
                          },
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
                          keyboardType: TextInputType.number,
                          controller: cutSizeCon,
                          decoration: InputDecoration(
                            labelText: "Cut Size",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: rollSizeCon,
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
                          keyboardType: TextInputType.number,
                    controller: quantityCon,
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Buttons Section
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              lengthCon.clear();
                              widthCon.clear();
                              heightCon.clear();
                            });
                          },
                          child: Text("RESET"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            double? length = double.tryParse(lengthCon.text);
                            double? width = double.tryParse(widthCon.text);
                            double? height = double.tryParse(heightCon.text);
                            double? cutSize = double.tryParse(cutSizeCon.text);
                            double? rollSize = double.tryParse(rollSizeCon.text);
                            double? quantity = double.tryParse(quantityCon.text)??0.0;
                            if (length != null && width != null && height != null&&  cutSize != null && rollSize != null) {
                              final dataController = Get.put(FPSController());
                              dataController.updateData(length,width,height, cutSize, rollSize, quantity);

                              Get.to(() => FpSecond());
                            }
                          },
                          child: Text("Cost Manual Machines"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                        ),
                      ),
                      SizedBox(width: 8),
                      // Expanded(
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       Get.to(FpThird());
                      //     },
                      //     child: Text("Cost Corrugator Line"),
                      //     style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            ),
        );
    }
}
