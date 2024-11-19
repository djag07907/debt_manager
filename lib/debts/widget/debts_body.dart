import 'package:debt_manager/debtDetail/debt_detail_screen.dart';
import 'package:debt_manager/debtRegistration/debt_registration_screen.dart';
import 'package:debt_manager/debts/models/bill_model.dart';
import 'package:debt_manager/debts/models/debt_model.dart';
import 'package:flutter/material.dart';

class DebtsBody extends StatelessWidget {
  const DebtsBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for debts
    final List<Debt> debts = [
      Debt(
        affair: 'Home Loan',
        bills: [
          Bill(
            description: 'First payment',
            cost: 250000,
            debtors: [],
            dueDate: DateTime(2024, 12, 31),
          ),
        ],
        createdAt: DateTime.now(),
      ),
      Debt(
        affair: 'Car Loan',
        bills: [
          Bill(
            description: 'First payment',
            cost: 35000,
            debtors: [],
            dueDate: DateTime(2024, 6, 30),
          ),
        ],
        createdAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debts'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search debts...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: debts.length,
              itemBuilder: (context, index) {
                final debt = debts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    title: Text(debt.affair),
                    subtitle: Text(
                      'Total Amount: \$${debt.totalAmount.toStringAsFixed(2)}\n'
                      'Bills: ${debt.bills.length}',
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DebtDetailScreen(debt: debt),
                          ),
                        );
                      },
                      child: const Text('See Debt'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DebtRegistrationScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFF2C37C6),
        child: const Icon(Icons.add),
      ),
    );
  }
}
