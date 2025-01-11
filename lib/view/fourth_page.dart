import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PageBController.dart';
import 'fourth_second.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final TextEditingController length1Con = TextEditingController();
  final TextEditingController length2Con = TextEditingController();
  final TextEditingController gazzeteCon = TextEditingController();
  final TextEditingController widthCon = TextEditingController();
  final TextEditingController cutSizeCon = TextEditingController();
  final TextEditingController rollSizeCon = TextEditingController();
  final TextEditingController cutSizeCon1 = TextEditingController();
  final TextEditingController rollSizeCon1 = TextEditingController();
  // final TextEditingController quantityCon = TextEditingController();

  String unit = "inch";
  num upm = 2;
  num up = 1;

  @override
  void dispose() {
    length1Con.dispose();
    length2Con.dispose();
    gazzeteCon.dispose();
    widthCon.dispose();
    super.dispose();
  }

  void onUnitChanged(String value) {
    setState(() {
      unit = value;
      upm = unit == "inch" ? 2.0 : (unit == "cm" ? 5.08 : 50.8);
    });
  }

  num sheetlf() {
    double? length1 = double.tryParse(length1Con.text) ?? 0.0;
    double? length2 = double.tryParse(length2Con.text) ?? 0.0;
    double? gazzete = double.tryParse(gazzeteCon.text) ?? 0.0;
    if (length2 + length1 + gazzete <= 10) {
      rollSizeCon1.text = "4";
      return ((length2 + length1 + gazzete) * 4) + upm;
    } else if (length2 + length1 + gazzete <= 14) {
      rollSizeCon1.text = "3";
      return ((length2 + length1 + gazzete) * 3) + upm;
    } else if (length2 + length1 + gazzete < 22) {
      rollSizeCon1.text = "2";
      return ((length2 + length1 + gazzete) * 2) + upm;
    }
    rollSizeCon1.text = "1";
    return (length2 + length1 + gazzete + upm);
  }

  num sheetwf() {
    double? width = double.tryParse(widthCon.text) ?? 0.0;
    if (width <= 7) {
      cutSizeCon1.text = "6";
      return ((width) * 6) + up;
    } else if (width <= 8) {
      cutSizeCon1.text = "5";
      return ((width) * 6) + up;
    } else if (width <= 10) {
      cutSizeCon1.text = "4";
      return ((width) * 6) + up;
    } else if (width <= 14) {
      cutSizeCon1.text = "3";
      return ((width) * 6) + up;
    } else if (width <= 21) {
      cutSizeCon1.text = "2";
      return ((width) * 6) + up;
    }
    cutSizeCon1.text = "1";
    return (width + upm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.green[100],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: "Size [L1 + G + G + L2 x W]"),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                          controller: length1Con,
                          label: "Length 1",
                          onChanged: (value) {
                            setState(() {
                              num sheetlVal = sheetlf();
                              print("Length 1 value: $sheetlVal");
                              rollSizeCon.text = sheetlVal.toString();
                              // You can also update any related fields or calculations here
                            });
                          })),
                  SizedBox(width: 8),
                  Expanded(
                      child: InputField(
                          controller: gazzeteCon,
                          label: "Gazzete",
                          onChanged: (value) {
                            num sheetlVal = sheetlf();
                            setState(() {
                              print("Length 1 value: $sheetlVal");
                              rollSizeCon.text = sheetlVal.toString();
                              // You can also update any related fields or calculations here
                            });
                          })),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                          controller: length2Con,
                          label: "Length 2",
                          onChanged: (value) {
                            num sheetlVal = sheetlf();
                            setState(() {
                              print("Length 1 value: $sheetlVal");
                              rollSizeCon.text = sheetlVal.toString();
                              // You can also update any related fields or calculations here
                            });
                          })),
                  SizedBox(width: 8),
                  Expanded(
                      child: InputField(
                          controller: widthCon,
                          label: "Width",
                          onChanged: (value) {
                            setState(() {
                              cutSizeCon.text = sheetwf().toString();
                              // You can also update any related fields or calculations here
                            });
                          })),
                ],
              ),
              SizedBox(height: 16),
              // SectionTitle(title: "Measurement Unit"),
              // Row(
              //   children: [
              //     Expanded(
              //         child: UnitRadio(
              //             value: "inch",
              //             groupValue: unit,
              //             onChanged: onUnitChanged)),
              //     Expanded(
              //         child: UnitRadio(
              //             value: "cm",
              //             groupValue: unit,
              //             onChanged: onUnitChanged)),
              //     Expanded(
              //         child: UnitRadio(
              //             value: "mm",
              //             groupValue: unit,
              //             onChanged: onUnitChanged)),
              //   ],
              // ),
              // SizedBox(height: 16),

              SectionTitle(title: "Sheet Size[Cutting x Roll Size]"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                          controller: cutSizeCon, label: "Cut Size")),
                  SizedBox(width: 8),
                  Expanded(
                      child: InputField(
                          controller: rollSizeCon, label: "Deckle/Roll Size")),
                ],
              ),
              SizedBox(height: 16),

              SectionTitle(title: "No of Sheets[Cutting x Roll Size]"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                          controller: cutSizeCon1, label: "Cut Size")),
                  SizedBox(width: 8),
                  Expanded(
                      child: InputField(
                          controller: rollSizeCon1, label: "Deckle/Roll Size")),
                ],
              ),
              SizedBox(height: 16),


              // Add more sections as needed
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          length1Con.clear();
                          length2Con.clear();
                          gazzeteCon.clear();
                          widthCon.clear();
                        });
                      },
                      child: Text("RESET"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[100]),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        double? length = double.tryParse(length1Con.text);
                        double? length2 = double.tryParse(length2Con.text);
                        double? gazzete = double.tryParse(gazzeteCon.text)??0.0;
                        double? width = double.tryParse(widthCon.text);
                        double? cutSize = double.tryParse(cutSizeCon.text);
                        double? rollSize = double.tryParse(rollSizeCon.text);
                        double? cutSize1 = double.tryParse(cutSizeCon1.text)??0.0;
                        double? rollSize1 = double.tryParse(rollSizeCon1.text)??0.0;
                        if (length != null &&
                            width != null &&
                            length2 != null &&
                            cutSize != null &&
                            rollSize != null) {
                          final dataController = Get.put(FPSController());
                          dataController.stifnerData(length, length2, gazzete,
                              width, cutSize, rollSize, cutSize1, rollSize1);

                          Get.to(FourthSecondPage());
                        }
                      },
                      child: Text("Cost Manual Machines"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[100]),
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

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueChanged<String>? onChanged;

  const InputField(
      {required this.controller, required this.label, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class UnitRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const UnitRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: (String? newValue) {
        if (newValue != null) onChanged(newValue);
      },
      title: Text(value),
    );
  }
}
