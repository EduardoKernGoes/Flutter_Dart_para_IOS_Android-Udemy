import 'package:flutter/material.dart';
import 'package:secao4_despesas_pessoais/components/chart.dart';
import 'package:secao4_despesas_pessoais/components/transaction_form.dart';
import 'dart:math';
import '../models/transaction.dart';
import 'components/transaction_list.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.purple,
          secondary: Colors.amber,
        )
      )
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
    Transaction(
      id: 't1',
      title: 'title',
      value: 50,
      date: DateTime.now()
    ),
  ];
  bool _showChart = false;

  List<Transaction> get _recentTransactions{
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _deleteTransaction (String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_){
        return TransactionForm(_addTransaction);
      }
    );
  }

  _addTransaction(String title, double value, DateTime date){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date
    );

    setState((){
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Despesas Pessoais'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        )
      ],
    );
    final availabelHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Exibir Gráfico'),
                Switch(value: _showChart, onChanged: (value) {
                  setState(() {
                    _showChart = value;
                  });
                },),
              ],
            ),
            if(_showChart)
            Container(
              height: availabelHeight * 0.25,
              child: Chart(_recentTransactions)
            ),
            if(!_showChart)
            Container(
              height: availabelHeight * 0.75,
              child: TransactionList(_transactions, _deleteTransaction)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}