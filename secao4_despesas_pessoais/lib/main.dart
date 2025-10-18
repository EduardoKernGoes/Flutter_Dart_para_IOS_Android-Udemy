import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secao4_despesas_pessoais/components/chart.dart';
import 'package:secao4_despesas_pessoais/components/transaction_form.dart';
import 'dart:math';
import 'dart:io';
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

  Widget _getIconButton(IconData icon, Function () fn) {
    return Platform.isIOS ? 
    GestureDetector(
      onTap: fn, child: Icon(icon),
    )
    : 
    IconButton(
      icon: Icon(icon),
      onPressed: fn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final actions = <Widget>[
        if(isLandscape)
          _getIconButton(
            _showChart ? Icons.list : Icons.show_chart,
            () {
              setState(() {
                _showChart = !_showChart;
              });
            },
          ),
        _getIconButton(
          Platform.isIOS ? CupertinoIcons.add : Icons.add,() => _openTransactionFormModal(context)
        )
      ];
    final PreferredSizeWidget appBar = AppBar(
      title: Text('Despesas Pessoais'),
      actions: actions,
    );
    final availabelHeight = mediaQuery.size.height - mediaQuery.padding.top - appBar.preferredSize.height;
    final bodyPage = SafeArea(
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if(_showChart || !isLandscape)
              Container(
                height: availabelHeight * (isLandscape ? 0.85 : 0.25),
                child: Chart(_recentTransactions)
              ),
              if(!_showChart || !isLandscape)
              Container(
                height: availabelHeight * (isLandscape ? 0.9 : 0.68),
                child: TransactionList(_transactions, _deleteTransaction)
              ),
            ],
          ),
        ),
    );

    return Platform.isIOS ? 
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Despesas Pessoais'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: actions,
        ),
      ),
      child: bodyPage,
    ) : Scaffold(
      appBar: appBar,
      body: bodyPage,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}