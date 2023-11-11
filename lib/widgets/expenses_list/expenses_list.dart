import 'package:expensetracker/model/expense.dart';
import 'package:expensetracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenseList, required this.removeExpense});

  final void Function(Expense data) removeExpense;
  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            margin: Theme.of(context).cardTheme.margin,
            color: Theme.of(context).colorScheme.error.withOpacity(0.70),
          ),
          key: ValueKey(expenseList[index]),
          onDismissed: (direction) {
            removeExpense(expenseList[index]);
          },
          child: ExpenseItem(expense: expenseList[index]),
        );
      },
    );
  }
}
