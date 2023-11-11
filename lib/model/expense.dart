import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Global Objects To Create the unique Id and Date Formatting
const Uuid uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { leisure, food, work, travel }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String getFormattedDate() {
    return formatter.format(date).toString();
  }
}
