import 'package:flutter/material.dart';
import 'package:flutter_class_project/view/fifth_page.dart';
import 'package:flutter_class_project/view/first_page.dart';
import 'package:flutter_class_project/view/fourth_page.dart';
import 'package:flutter_class_project/view/second_page.dart';
import 'package:flutter_class_project/view/seventh_page.dart';
import 'package:flutter_class_project/view/sixth_page.dart';
import 'package:flutter_class_project/view/third_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(CertainApp());
}

class CertainApp extends StatefulWidget {
  const CertainApp({super.key});

  @override
  State<CertainApp> createState() => _CertainAppState();
}

class _CertainAppState extends State<CertainApp> {
  Color _containerColor = Colors.green;

  void _changeColor() {
    setState(() {
      _containerColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Certain App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Color(0xFF673AB7),
        secondaryHeaderColor: Color(0xFFD1C4E9),
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carton App'),
          backgroundColor: Colors.green[100],
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                currentAccountPicture: Icon(
                  Icons.inventory_2_rounded,
                  size: 50,
                  color: Colors.amber,
                ),
                accountName: Text(
                  'Paper and Packages',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                accountEmail: Text(
                  'AlphaSoftware',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.brown),
                title: Text('Corrugated Carton Cost'),
                onTap: () {
                  Get.to(FirstPage());
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate, color: Colors.black54),
                title: Text('Sheet/Stiffener Cost'),
                onTap: () {
                  Get.to(FourthPage());
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment, color: Colors.blueAccent),
                title: Text('GSM Calc of Corru. Roll'),
                onTap: () {
                  Get.to(SixthPage());
                },
              ),
              ListTile(
                leading: Icon(Icons.cut, color: Colors.grey),
                title: Text('Deckle Slit Combinations'),
                onTap: () {
                  Get.to(SecondPage());
                },
              ),
              ListTile(
                leading: Icon(Icons.circle_outlined, color: Colors.orange),
                title: Text('Paper Roll Dia to Weight'),
                onTap: () {
                  Get.to(ThirdPage());
                },
              ),
              ListTile(
                leading: Icon(Icons.straighten, color: Colors.black),
                title: Text('Sheet Size to Weight'),
                onTap: () {
                  Get.to(FifthPage());
                },
              ),
              ListTile(
                leading: Icon(Icons.layers, color: Colors.grey),
                title: Text('Reel Weight to Sheets'),
                onTap: () {
                  // Handle navigation if necessary
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.red),
                title: Text('Setting'),
                onTap: () {
                  Get.to(SeventhPage());
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStyledContainer(
                    image: 'assets/cardboard box.png',
                    text: "Carton Cost",
                    color: Colors.white,
                    onTap: () {
                      Get.to(FirstPage());
                    },
                  ),
                  buildStyledContainer(
                    image: 'assets/cardboard cutting.png',
                    text: "Slit Comb.",
                    color: Colors.white,
                    onTap: () {
                      Get.to(SecondPage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStyledContainer(
                    image: 'assets/cardboard roll.png',
                    text: "Roll Cost",
                    color: Colors.white,
                    onTap: () {
                      Get.to(ThirdPage());
                    },
                  ),
                  buildStyledContainer(
                    image: 'assets/cardboard stiffenar.png',
                    text: "Stiffner Cost",
                    color: Colors.white,
                    onTap: () {
                      Get.to(FourthPage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStyledContainer(
                    image: 'assets/Weight.png',
                    text: "Weight.calc",
                    color: Colors.white,
                    onTap: () {
                      Get.to(FifthPage());
                    },
                  ),
                  buildStyledContainer(
                    image: 'assets/GMS clac.png',
                    text: "GSM Calc",
                    color: Colors.white,
                    onTap: () {
                      Get.to(SixthPage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildStyledContainer(
                    image: 'assets/settings.png',
                    text: "Settings",
                    color: Colors.white,
                    onTap: () {
                      Get.to(SeventhPage());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStyledContainer({
    required String image,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 90),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
