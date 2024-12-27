import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

enum Category{
  food, work, leisure, transport, other
}

final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.work: Icons.work,
  Category.leisure: Icons.party_mode,
  Category.transport: Icons.directions_car,
  Category.other: Icons.attach_money,
};

class Expense {
  Expense({
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category,
  }): id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => formatter.format(date);
}

class ExpenseBucket{
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category): expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum = 0;
    for (var expense in expenses){
      sum += expense.amount;
    }
    return sum;
  }

}

