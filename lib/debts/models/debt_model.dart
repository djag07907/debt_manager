import 'package:debt_manager/debts/models/bill_model.dart';

class Debt {
  final String affair;
  final List<Bill> bills;
  final DateTime createdAt;

  Debt({
    required this.affair,
    required this.bills,
    required this.createdAt,
  });

  double get totalAmount {
    return bills.fold(0, (sum, bill) => sum + bill.cost);
  }

  Map<String, dynamic> toMap() {
    return {
      'affair': affair,
      'bills': bills.map((bill) => bill.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Debt.fromMap(Map<String, dynamic> map) {
    return Debt(
      affair: map['affair'],
      bills: (map['bills'] as List).map((bill) => Bill.fromMap(bill)).toList(),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
