import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onsSubmit;

  TransactionForm (this.onsSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation:5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                children:[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    )
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    )
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton( 
                        child: Text(
                          'Nova Transação',
                          style: TextStyle (
                            color: Colors.purple,
                          ),
                          ),
                        onPressed: () {
                          final title = titleController.text;
                          final value =double.tryParse(valueController.text)?? 0.0;
                          onsSubmit(title, value);
                        },
                      ),
                    ],
                  )
                ],
                ),
            ),
          ),
        );
  }
}