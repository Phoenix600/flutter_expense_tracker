import 'package:expensetracker/model/expense.dart';

List<Expense> getExpensesList() {
  final List<Expense> list = [
    Expense(
        title: "Photoshop Course",
        amount: 27.03,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "HeadSets",
        amount: 188.00,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Cinema",
        amount: 25.00,
        date: DateTime.now(),
        category: Category.food),
  ];

  return list;
}
