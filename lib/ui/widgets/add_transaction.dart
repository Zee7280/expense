import 'package:expense_manager/models/transaction.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function(Transaction transaction) addTransactionFunction;

  const AddTransaction(this.addTransactionFunction, {Key? key})
      : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController purposeCon = TextEditingController();
  TextEditingController amountCon = TextEditingController();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const Text(
            'Add Data',
            style: TextStyle(fontSize: 17),
          ),
          TextField(
            controller: purposeCon,
            decoration: const InputDecoration(hintText: 'Purpose'),
          ),
          TextField(
            maxLength: 5,
            controller: amountCon,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Amount'),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(fontSize: 15),
              ),
              ElevatedButton(
                onPressed: _pickDate,
                child: const Text('Pick Date'),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  _pickDate() async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      setState(() {
        date = pickedDate;
      });
    }
  }

  _save() {
    Transaction transaction = Transaction(
      id: DateTime.now().millisecondsSinceEpoch,
      amount: amountCon.text.trim(),
      purpose: purposeCon.text.trim(),
      dateAdded: date,
    );

    widget.addTransactionFunction(transaction);
    Navigator.pop(context);
  }
}
