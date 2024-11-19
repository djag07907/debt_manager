import 'package:flutter/material.dart';

class PaymentsBody extends StatelessWidget {
  const PaymentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for payments
    final List<Map<String, dynamic>> payments = [
      {
        'debtName': 'Home Loan',
        'amount': 2500,
        'date': '2023-05-01',
        'status': 'Completed',
      },
      {
        'debtName': 'Car Loan',
        'amount': 500,
        'date': '2023-05-15',
        'status': 'Pending',
      },
      // Add more mock data as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
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
                hintText: 'Search payments...',
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
              itemCount: payments.length,
              itemBuilder: (context, index) {
                final payment = payments[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    title: Text(payment['debtName']),
                    subtitle: Text('Date: ${payment['date']}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${payment['amount']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C37C6),
                          ),
                        ),
                        Text(
                          payment['status'],
                          style: TextStyle(
                            color: payment['status'] == 'Completed'
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
