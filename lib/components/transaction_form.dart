import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onsSubmit;

  TransactionForm (this.onsSubmit);

  _submitForm(){
     
    final title = titleController.text;
    final value =double.tryParse(valueController.text)?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }              
    onsSubmit (title, value);
  }

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
                    onSubmitted:(_) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Título',
                    )
                  ),
                  TextField(
                    controller: valueController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted:(_) => _submitForm(),
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
                        onPressed: _submitForm,
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