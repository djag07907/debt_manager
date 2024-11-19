import 'package:flutter/material.dart';
import 'package:debt_manager/debts/models/bill_model.dart';
import 'package:debt_manager/debts/models/debtor_model.dart';

class NewBillDialog extends StatefulWidget {
  const NewBillDialog({Key? key}) : super(key: key);

  @override
  _NewBillDialogState createState() => _NewBillDialogState();
}

class _NewBillDialogState extends State<NewBillDialog> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final List<Debtor> _debtors = [];
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Bill'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _costController,
                decoration: const InputDecoration(labelText: 'Cost'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a cost';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              ListTile(
                title: const Text('Due Date'),
                subtitle: Text('${_selectedDate.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 10),
              ..._debtors.map((debtor) => ListTile(
                    title: Text(debtor.name),
                    trailing: Text('\$${debtor.amountToPay}'),
                  )),
              ElevatedButton(
                onPressed: _addDebtor,
                child: const Text('Add Debtor'),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: _addBill,
        ),
      ],
    );
  }

  void _addDebtor() {
    // Implement a dialog to add a new debtor
    // For now, we'll just add a dummy debtor
    setState(() {
      _debtors.add(Debtor(name: 'New Debtor', amountToPay: 0));
    });
  }

  void _addBill() {
    if (_formKey.currentState!.validate()) {
      final newBill = Bill(
        description: _descriptionController.text,
        cost: double.parse(_costController.text),
        debtors: _debtors,
        dueDate: _selectedDate,
      );
      Navigator.of(context).pop(newBill);
    }
  }
}
