import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Transaction> transaction = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  // String? titleInput;
  // String? amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
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
              Card(
                elevation: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: "Title"),
                        controller: titleController,
                        // onChanged: (value) {
                        //   titleInput = value;
                        // },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Amout"),
                        controller: amountController,
                        // onChanged: (value) {
                        //   amountInput = value;
                        // },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Add Transaction"),
                        style: TextButton.styleFrom(
                          primary: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: transaction
                    .map((tx) => Card(
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 1),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Text(
                                    '\$${tx.amount}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.blueAccent),
                                  )),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tx.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd').format(tx.date),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              )
            ]),
      ),
    );
  }
}
