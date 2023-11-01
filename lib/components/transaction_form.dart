import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onsSubmit;

  TransactionForm (this.onsSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForm(){
     
    final title = _titleController.text;
    final value =double.tryParse(_valueController.text)?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }              
    widget.onsSubmit (title, value);
  }
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(), 
      ).then((pickedDate){
        if(pickedDate == null){
          return;
        }
        setState((){
          _selectedDate = pickedDate;
        });
      });
      print('Executado!!!');
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
                    controller: _titleController,
                    onSubmitted:(_) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Título',
                    )
                  ),
                  TextField(
                    controller: _valueController,
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
                          Expanded(
                            child: Text(
                              _selectedDate == null ? 'Nenhuma data selecionada!' : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}'
                               ),
                          ),
                          TextButton(
                          child: const Text(
                          'Selecionar Data',
                           style: TextStyle(
                            fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker,
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