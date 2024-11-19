import 'package:debt_manager/commons/dialogs/edit_bill_dialog.dart';
import 'package:debt_manager/commons/dialogs/new_bill_dialog.dart';
import 'package:debt_manager/debts/models/bill_model.dart';
import 'package:debt_manager/debts/models/debt_model.dart';
import 'package:flutter/material.dart';

class DebtRegistrationBody extends StatefulWidget {
  const DebtRegistrationBody({super.key});

  @override
  State<DebtRegistrationBody> createState() => _DebtRegistrationBodyState();
}

class _DebtRegistrationBodyState extends State<DebtRegistrationBody> {
  final _formKey = GlobalKey<FormState>();
  final _affairController = TextEditingController();
  final List<Bill> _bills = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Debt'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _affairController,
              decoration: const InputDecoration(
                labelText: 'Affair',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an affair';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Bills',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ..._bills.map((bill) => _buildBillCard(bill)).toList(),
            ElevatedButton.icon(
              onPressed: _addNewBill,
              icon: const Icon(Icons.add),
              label: const Text('Add Bill'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveDebt,
              child: const Text('Save Debt'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillCard(Bill bill) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${bill.description}'),
            Text('Cost: \${bill.cost}'),
            Text('Debtors: ${bill.debtors.length}'),
            Text(
              'Amount Assigned: \${bill.totalPaid} / \${bill.cost}',
              style: TextStyle(
                color: bill.isFullyAssigned ? Colors.green : Colors.red,
              ),
            ),
            TextButton(
              onPressed: () => _editBill(bill),
              child: const Text('Edit Bill'),
            ),
          ],
        ),
      ),
    );
  }

  void _addNewBill() async {
    final result = await showDialog<Bill>(
      context: context,
      builder: (context) => const NewBillDialog(),
    );

    if (result != null) {
      setState(() {
        _bills.add(result);
      });
    }
  }

  void _editBill(Bill bill) async {
    final result = await showDialog<Bill>(
      context: context,
      builder: (context) => EditBillDialog(bill: bill),
    );

    if (result != null) {
      setState(() {
        final index = _bills.indexOf(bill);
        _bills[index] = result;
      });
    }
  }

  void _saveDebt() {
    if (_formKey.currentState!.validate() && _bills.isNotEmpty) {
      final newDebt = Debt(
        affair: _affairController.text,
        bills: _bills,
        createdAt: DateTime.now(),
      );

      // Here you would typically save the debt to your storage/backend

      Navigator.pop(context, newDebt);
    }
  }

  @override
  void dispose() {
    _affairController.dispose();
    super.dispose();
  }
}
