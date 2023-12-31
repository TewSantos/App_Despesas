import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'components/chart.dart';
import 'models/transaction.dart';
main() => runApp(ExpensesApp());


class ExpensesApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    final ThemeData tema = ThemeData();


    return MaterialApp(
      home:MyHomePage(),
      theme:  tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final List<Transaction>_transactions = [
   Transaction(
    id: 't0', 
    title: 'Conta Antiga', 
    value: 400.00, 
    date: DateTime.now().subtract(Duration(days: 33)),
    ),
   Transaction(
    id: 't1', 
    title: 'Novo Tênis de Corrida', 
    value: 310.76, 
    date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2', 
      title: 'Conta De Luz', 
      value: 211.30, 
      date: DateTime.now().subtract(Duration(days: 4)),
      ),
      Transaction(
      id: 't3', 
      title: 'Cartão de Crédito', 
      value: 100211.30, 
      date: DateTime.now(),
      ),
      Transaction(
      id: 't4', 
      title: 'Lanche', 
      value: 11.30, 
      date: DateTime.now(),
      ),
  ];

  List<Transaction> get _recentTransactions{
    return _transactions.where((tr){
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }
    _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id : Random(). nextDouble(). toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }
  _openTransactionFormModal(BuildContext context){
   showModalBottomSheet(
    context: context, 
    builder: (_) {
      return TransactionForm(_addTransaction);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text ('Despesas Pessoais'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal (context),
        )
      ],
     ),
     body: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Chart(_recentTransactions) ,
          TransactionList(_transactions),
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