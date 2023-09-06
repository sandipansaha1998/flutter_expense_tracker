import 'package:flutter/material.dart';
import 'package:my_notes/components/dashboard_components/display_card.dart';
import 'package:my_notes/components/form_components/switch_button.dart';
import 'package:my_notes/views/add_expense_form.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalIncome = 0;
  int totalExpenditure = 0;
  int balance = 0;

  updateIncome(int value) {
    setState(() {
      totalIncome += value;
      balance += value;
    });
  }

  updateExpenditure(int value) {
    setState(() {
      totalExpenditure += value;
      balance -= value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker')),
      body: Column(
        children: [
          Row(
            children: [
              DisplayCard(totalIncome, 'Total Income'),
              DisplayCard(totalExpenditure, 'Total Expenditure'),
              DisplayCard(balance, 'Balance')
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(children: [
                      AddExpenseForm(updateIncome, updateExpenditure)
                    ]))),
          )
        ],
      ),
    );
  }
}
