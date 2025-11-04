import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'expense_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),
  ];


  void _addExpense() {
    showModalBottomSheet(context: context, builder: (ctx) => 
    NewExpenses(onAddExpense: _saveExpenseData,),
    );
  }

  void _saveExpenseData(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpensesTracker'),
        actions: [
          IconButton(
            onPressed: _addExpense,
            icon: const Icon(Icons.add),
          ),
          ],
        ),
      body: Column(
        children: [
          Expanded( 
          child: ExpensesList(
            expenses: _registeredExpenses
            )
          )
        ],
      ),  
    );
  }
}
