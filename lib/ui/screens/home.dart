import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/ui/widgets/add_transaction.dart';
import 'package:expense_manager/ui/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transaction> transactions = [];

  _addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Expense Manager'),
        actions: [
          IconButton(
            onPressed: () => _addData(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addData(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              color: Colors.purple,
              child: const Text('expense Chart'),
              height: 50,
            ),
          ),
          Expanded(
            child: Card(
              child: TransactionsList(transactions),
            ),
          ),
        ],
      ),
    );
  }

  void _addData(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AddTransaction(_addTransaction);
      },
    );
  }
}
