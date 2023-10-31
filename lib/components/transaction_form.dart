import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onsSubmit;

  TransactionForm (this.onsSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
     
    final title = titleController.text;
    final value =double.tryParse(valueController.text)?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }              
    widget.onsSubmit (title, value);
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
                    SizedBox(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          const Text('Nenhuma data selecionada!'),
                          TextButton(
                          child: const Text(
                          'Selecionar Data',
                           style: TextStyle(
                            fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton( 
                        child: Text(
                          'Nova Transação',
                          style: TextStyle (
                            color: Theme.of(context).textTheme.button?.color,
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