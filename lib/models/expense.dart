import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum ExpenseCategory {
  food,
  travel,
  leisure,
  work,
  other,
}

const categoryItems = {
  ExpenseCategory.food: Icons.restaurant,
  ExpenseCategory.travel: Icons.flight,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
  ExpenseCategory.other: Icons.shopping_cart,
};



class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category}
      ) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return formatter.format(date);
  }
}