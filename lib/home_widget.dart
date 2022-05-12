import 'dart:ui';

import 'package:first_app/app_controller.dart';
import 'package:first_app/app_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vamo F1?',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Contador: $counter',
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
            ),
            Switch(
              value: AppController.instance.isDark,
              onChanged: (value) {
                AppController.instance.changeTheme();
              },
            ),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
