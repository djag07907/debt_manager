import 'package:debt_manager/debts/models/bill_model.dart';
import 'package:debt_manager/debts/models/debt_model.dart';
import 'package:flutter/material.dart';

class DebtDetailBody extends StatelessWidget {
  final Debt debt;

  const DebtDetailBody({
    super.key,
    required this.debt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(debt.affair),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Amount: \$${debt.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Created: ${debt.createdAt.toString().split(' ')[0]}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
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
          ...debt.bills.map((bill) => _buildBillCard(bill)).toList(),
        ],
      ),
    );
  }

  Widget _buildBillCard(Bill bill) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(bill.description),
        subtitle: const Text('Cost: \${bill.cost}'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Due Date: ${bill.dueDate.toString().split(' ')[0]}'),
                const SizedBox(height: 8),
                const Text(
                  'Debtors:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...bill.debtors.map((debtor) => ListTile(
                      title: Text(debtor.name),
                      trailing: Text('\${debtor.amountToPay}'),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
