import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDelete;

  TransactionList(this.transactions, this.onDelete);

  @override
  Widget build(BuildContext context) {

    return transactions.isEmpty ?
      LayoutBuilder(
        builder: (ctx, constraints){
          return Column(
            children: <Widget> [
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.1,
                child: Text(
                  'Nenhuma Transação Cadastrada!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.5,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        }
      )
      : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index){
        final tr = transactions[index];
        return TransactionItem(tr: tr, onDelete: onDelete);
      },
    );
  }
}