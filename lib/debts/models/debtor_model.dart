class Debtor {
  final String name;
  final double amountToPay;

  Debtor({
    required this.name,
    required this.amountToPay,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amountToPay': amountToPay,
    };
  }

  factory Debtor.fromMap(Map<String, dynamic> map) {
    return Debtor(
      name: map['name'],
      amountToPay: map['amountToPay'],
    );
  }
}
