import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onDelete,
  });

  final Transaction tr;
  final void Function(String p1) onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              height: 20,
              child: FittedBox(child:
                Text(
                  'R\$${tr.value}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          tr.title, 
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(DateFormat('d MMM y').format(tr.date)),
        trailing: MediaQuery.of(context).size.width > 480 ? 
          TextButton.icon(
            onPressed: () => onDelete(tr.id),
            icon: Icon(Icons.delete, color: Colors.red,),
            label: Text('Excluir', style: TextStyle(color: Colors.red),),
          )
          : IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () => onDelete(tr.id),
        ),
      ),
    );
  }
}