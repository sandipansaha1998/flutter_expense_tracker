import 'package:flutter/material.dart';
import 'package:my_notes/components/form_components/customFormField.dart';
import 'package:date_field/date_field.dart';
import 'package:my_notes/components/form_components/switch_button.dart';

class AddExpenseForm extends StatefulWidget {
  late Function updateIncome;
  late Function updateExpenditure;
  AddExpenseForm(this.updateIncome, this.updateExpenditure, {super.key});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isTransactionCredit = true;
  late int _transactionAmount = 0;
  late DateTime? _transactionDate;

  toggleTransactionType() {
    setState(() {
      _isTransactionCredit = !_isTransactionCredit;
    });
  }

  setTransactionAmount(value) {
    setState(() {
      _transactionAmount = value;
    });
  }

  setTransactionDate(value) {
    setState(() {
      _transactionDate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      'Amount : $_transactionAmount   ${_isTransactionCredit ? 'Credit' : 'Debit'}'),
                  CustomSwitch(_isTransactionCredit, toggleTransactionType),
                  CustomFormField(
                      'Transaction Amount',
                      Icons.attach_money_rounded,
                      'Please Enter the transaction amount',
                      setTransactionAmount),
                  // CustomFormField(
                  //     'Description', Icons.notes, 'Where did you spend'),
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.event_note),
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      labelText: 'Transaction time and date',
                    ),
                    mode: DateTimeFieldPickerMode.dateAndTime,
                    autovalidateMode: AutovalidateMode.always,
                    onDateSelected: (DateTime value) {
                      setTransactionDate(value);
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.save();
                        print(
                            'Amoount : $_transactionAmount , Date: $_transactionDate ${_isTransactionCredit ? 'Credit' : 'Debit'}');
                        if (_isTransactionCredit) {
                          widget.updateIncome(_transactionAmount);
                        } else {
                          widget.updateExpenditure(_transactionAmount);
                        }
                      },
                      child: const Icon(Icons.add))
                ]),
          ),
        ),
      ),
    ]);
  }
}
