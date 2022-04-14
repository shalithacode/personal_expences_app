import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void onSubmitHandler() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    }
    addNewTransaction(
        titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => onSubmitHandler(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onSubmitHandler(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            TextButton(
              onPressed: onSubmitHandler,
              child: Text("Add Transaction"),
              style: TextButton.styleFrom(
                primary: Colors.blueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
