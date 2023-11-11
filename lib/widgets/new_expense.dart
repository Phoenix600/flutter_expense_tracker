import 'package:expensetracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Global Object
final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  // Data Members
  final void Function(Expense data) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  String? titleData;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  // void _saveTitleData(String userInput) {
  //   titleData = userInput;
  //   // print(userInput);
  // }

  // function that opens the Calander Modal Overlay Screen
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
    // print(pickedDate);
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);

    // final enteredAmount = double.tryParse(_amountController.text) ?? 0.0;
    // bool amountIsValid = double == enteredAmount.runtimeType || enteredAmount > 0;
    bool amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_textEditingController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      showDialog(
          context: context,
          builder: (contextOfDialog) {
            return AlertDialog(
              title: const Text("Invalid Input"),
              content: const Text(
                  "Please make sure you have entered the valid title, amount and date"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(contextOfDialog);
                  },
                  child: const Text("Okay"),
                )
              ],
            );
          });
      return;
    }

    // Data Is Valid Do Some This Shit!!!
    widget.addExpense(
      Expense(
          title: _textEditingController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  // keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _selectedDate == null
                          ? 'Not Date Selected'
                          : formatter.format(_selectedDate!).toString(),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                    // print(value);
                  }),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              // SizedBox(
              //   height: 40,
              // ),
              ElevatedButton(
                  onPressed: () {
                    _submitExpenseData();
                    // print(_textEditingController.text);
                    // print(_amountController.text);
                  },
                  child: const Text("Add Expense"))
            ],
          ),
        ],
      ),
    );
  }
}
