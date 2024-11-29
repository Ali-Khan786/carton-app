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
        // Set background color to off-white
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Color(0xFF673AB7), // Primary purple color
        secondaryHeaderColor: Color(0xFFD1C4E9), // Secondary purple color
        fontFamily: 'Roboto', // Or your preferred font
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carton App'),
          // Set app bar color to very light green
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
            // Add your drawer items here
            children: [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Handle item 1 tap
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Handle item 2 tap
                  Navigator.pop(context); // Close the drawer
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
                    image: 'assets/cardboard box.png', // Replace with your image path
                    text: "Carton Cost",
                    color: Colors.white,
                    onTap: () {
                      Get.to(FirstPage());
                    },
                  ),
                  buildStyledContainer(
                    image: 'assets/cardboard cutting.png', // Replace with your image path
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
                    image: 'assets/cardboard roll.png', // Replace with your image path
                    text: "Roll Cost"
                    color: Colors.white,
                    onTap: () {
                      Get.to(ThirdPage());
                    },
                  ),
                  buildStyledContainer(
                    image: 'assets/cardboard stiffenar.png', // Replace with your image path
                    text: "fuck u",
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
                    image: 'assets/Weight.png', // Replace with your image path
                    text: "Hello World",
                    color: Colors.white,
                    onTap: () {
                      Get.to(FifthPage());
                    },
                  ),
                  buildStyledContainer(
                    image: 'assets/GMS clac.png', // Replace with your image path
                    text: "Bye World",
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
                    image: 'assets/settings.png', // Replace with your image path
                    text: "Bye World",
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
                color: Colors.black, // Adjust text color as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}