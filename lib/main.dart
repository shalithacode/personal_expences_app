import 'package:flutter/material.dart';
import './widget/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // String? titleInput;
  // String? amountInput;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blueAccent,
                    child: Text("Chart!"),
                    elevation: 5,
                  ),
                ),
                UserTransaction(),
              ]),
        ),
      ),
    );
  }
}
