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

  void _onRemoveExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = Center(child: 
    Text('No Expenses Found!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _onRemoveExpense,
        );
    }

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
          child: maincontent
            )
        ],
      ),  
    );
  }
}
