import 'package:flutter/material.dart';

main() => runApp(flutter1());


class flutter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ini aplikasi saya Natasya Intan Sukma Jiwanti"),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.teal,
                width: 2.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: 300,
            height: 150,
            child: Center(
              child: Text(
                "Belajar Container Flutter",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade900,
                ),
              ),
            ),
          ),
        ),
      ),
    ); 
  }
}