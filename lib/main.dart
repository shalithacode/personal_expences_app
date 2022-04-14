import 'package:flutter/material.dart';
import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transaction = [
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
  void _addNewTransaction(String title, double amount) {
    final newTX = Transaction(
        id: _transaction.length.toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transaction.add(newTX);
    });
  }

  // String? titleInput;
  void startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  startNewTransaction(context);
                },
                icon: Icon(Icons.add),
              );
            }),
          ],
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
                TransactionList(_transaction),
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              startNewTransaction(context);
            },
          );
        }),
      ),
    );
  }
}
