import 'package:flutter/material.dart';

class DebtsBody extends StatelessWidget {
  const DebtsBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for debts
    final List<Map<String, dynamic>> debts = [
      {
        'name': 'Home Loan',
        'amount': 250000,
        'dueDate': '2024-12-31',
      },
      {
        'name': 'Car Loan',
        'amount': 35000,
        'dueDate': '2024-06-30',
      },
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
                    title: Text(debt['name']),
                    subtitle: Text('Due: ${debt['dueDate']}'),
                    trailing: Text(
                      '\$${debt['amount']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C37C6),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2C37C6),
        child: const Icon(Icons.add),
      ),
    );
  }
}
