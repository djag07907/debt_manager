import 'package:debt_manager/debts/models/debtor_model.dart';

class Bill {
  final String description;
  final double cost;
  final List<Debtor> debtors;
  final DateTime dueDate;

  Bill({
    required this.description,
    required this.cost,
    required this.debtors,
    required this.dueDate,
  });

  double get totalPaid {
    return debtors.fold(0, (sum, debtor) => sum + debtor.amountToPay);
  }

  bool get isFullyAssigned => totalPaid >= cost;

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'cost': cost,
      'debtors': debtors.map((debtor) => debtor.toMap()).toList(),
      'dueDate': dueDate.toIso8601String(),
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      description: map['description'],
      cost: map['cost'],
      debtors: (map['debtors'] as List)
          .map((debtor) => Debtor.fromMap(debtor))
          .toList(),
      dueDate: DateTime.parse(map['dueDate']),
    );
  }
}
