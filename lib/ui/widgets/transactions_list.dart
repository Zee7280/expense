import 'package:expense_manager/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (_, index) {
        var date = transactions[index].dateAdded;
        return Card(
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text('Rs. ${transactions[index].amount}'),
            ),
            title: Text(transactions[index].purpose),
            subtitle: Text('${date.day}/${date.month}/${date.year}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
