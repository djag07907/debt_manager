import 'package:debt_manager/debtDetail/widget/debt_detail_body.dart';
import 'package:debt_manager/debts/models/debt_model.dart';
import 'package:flutter/material.dart';

class DebtDetailScreen extends StatelessWidget {
  final Debt debt;
  const DebtDetailScreen({
    super.key,
    required this.debt,
  });

  @override
  Widget build(BuildContext context) {
    return DebtDetailBody(debt: debt);
  }
}
