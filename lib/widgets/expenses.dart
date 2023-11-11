import 'package:expensetracker/data/dummy_data.dart';
import 'package:expensetracker/model/expense.dart';
import 'package:expensetracker/widgets/bar_chart/chart.dart';
import 'package:expensetracker/widgets/expenses_list/expenses_list.dart';
import 'package:expensetracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = getExpensesList();

  // Method to include the openAndExpenseOverlay
  void _openAndExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (contextModal) {
        return NewExpense(addExpense: _addExpense);
      },
      useSafeArea: true,
      // backgroundColor: Colors.amber[200],
    );
  }

  void _addExpense(Expense data) {
    setState(() {
      _registeredExpenses.add(data);
    });
  }

  void _removeExpense(Expense data) {
    final int expenseIndex = _registeredExpenses.indexOf(data);
    setState(() {
      _registeredExpenses.remove(data);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500 * 2),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, data);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No Expenes Found, Start Adding Some..."),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenseList: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: [
            IconButton(
              onPressed: _openAndExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: width < 600
            ? Column(
                children: <Widget>[
                  // const Text("Chart"),
                  Chart(expenses: _registeredExpenses),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: <Widget>[
                  // const Text("Chart"),
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ));
  }
}
